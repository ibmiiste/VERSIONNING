       ctl-opt nomain;
        /copy qcpysrc,cpyctlstm

      // >>PRE-COMPILER<<                                              */
      //   >>CRTCMD<<  CRTSQLRPGI SRCFILE(&SL/&SF) SRCMBR(&SM);        */
      //   >>IMPORTANT<<                                               */
      //     >>PARM<<  OBJ(&LI/&OB);                                   */
      //     >>PARM<<  OBJTYPE(*MODULE);                               */
      //     >>PARM<<  OPTION(*EVENTF);                                */
      //     >>PARM<<  RPGPPOPT(*LVL2);                                */
      //     >>PARM<<  CLOSQLCSR(*ENDACTGRP);                          */
      //     >>PARM<<  DATFMT(*ISO);                                   */
      //     >>PARM<<  TIMFMT(*ISO);                                   */
      //   >>END-IMPORTANT<<                                           */
      //   >>EXECUTE<<                                                 */
      // >>END-PRE-COMPILER<<                                          */

       dcl-f ftpcmd usage(*output) rename(ftpcmd:ftpcmdf);
       /copy qcpysrc,inh32768

       dcl-pr ECRITURE_SCRIPT_FTP;
         USER like(r_qualified);
         MDP like(r_qualified);
       End-Pr;

       dcl-proc ECRITURE_SCRIPT_FTP export;
       dcl-pi ECRITURE_SCRIPT_FTP;
         g_USER like(r_qualified);
         g_MDP like(r_qualified);
       End-Pi;

       dcl-s g_seq packed(6:2) inz(1);

       open ftpcmd;

       srcseq=g_seq;
       srcdat=*zero;
       srcdta = %trimr(g_USER) + ' ' + g_MDP;

       write ftpcmdf;

       g_seq=+1;
       srcseq=g_seq;
       srcdat=*zero;
       srcdta='bin';

       write ftpcmdf;

       g_seq=+1;
       srcseq=g_seq;
       srcdat=*zero;
       srcdta='put qtemp/livraison qgpl/livraison';

       write ftpcmdf;

       g_seq=+1;
       srcseq=g_seq;
       srcdat=*zero;
       srcdta='quit';

       write ftpcmdf;

       close ftpcmd;

       return;
       end-proc;
