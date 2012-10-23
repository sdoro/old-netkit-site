/* $Id: pam_calc.c,v 1.1 2005/03/12 07:49:47 doros Exp $ */

/*
 *  gcc -fPIC -c pam_calc.c 
 *  ld -x --shared -o pam_calc.so pam_calc.o
 *  cp pam_calc.so /lib/security
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* --- module type --- */
#define PAM_SM_AUTH

#include <security/pam_modules.h>

/* --- authentication management functions --- */

PAM_EXTERN
int pam_sm_authenticate (pam_handle_t *pamh, int flags,
                         int argc, const char **argv)
{
    return conversation (pamh);
}

PAM_EXTERN
int pam_sm_setcred (pam_handle_t *pamh, int flags,
                    int argc, const char **argv)
{
    return PAM_SUCCESS;
}

/* dummy conversation function sending exactly one prompt
   and expecting exactly one response from the other party */
static int converse (pam_handle_t *pamh,
                     struct pam_message **message,
                     struct pam_response **response)
{
    int retval;
    const struct pam_conv *conv;

    retval = pam_get_item (pamh, PAM_CONV, (const void **) &conv );
    if (retval == PAM_SUCCESS)
        retval = conv->conv (1, (const struct pam_message **)message,
                             response, conv->appdata_ptr);

    return retval; /* propagate error status */
}

/* --- This is a conversation function to obtain the user's response --- */
int conversation (pam_handle_t *pamh)
{
    struct pam_message msg[2],*pmsg[2];
    struct pam_response *resp;
    int retval;
    char * token = NULL;
    char answer[20];

    unsigned int n1, n2, reply;
    const char *user=NULL;

    srand(time(NULL));
    n1 = 1 + (rand() % 9);
    n2 = 1 + (rand() % 9);
    pam_get_user(pamh, &user, NULL);

    pmsg[0] = &msg[0];
    msg[0].msg_style = PAM_PROMPT_ECHO_OFF;
    sprintf(answer, "Ciao %s, quanto fa %d per %d ? ", user, n1, n2);
    msg[0].msg=answer;

    /* so call the conversation expecting i responses */
    resp = NULL;
    retval = converse (pamh, pmsg, &resp);

    if (resp != NULL) {
        /* interpret the response */
        if (retval == PAM_SUCCESS) { /* a good conversation */
            token = resp[0].resp;
            //token = strdup(resp[0].resp);
            if (token == NULL) {
                return PAM_AUTHTOK_RECOVER_ERR;
            }
        }
    }

    if ((sscanf(token,"%u",&reply)==1)&&(n1*n2==reply))
        return PAM_SUCCESS;
    else
        return PAM_AUTH_ERR;
}
