/*  Suppression de la biblioth�que du lot dans la liste syst�me des biblioth�ques   */
/*  CPP:  RMVLIBLOT                                                          */

             CMD        PROMPT('Suppression biblioth�que lot')

             PARM       KWD(LOT) TYPE(*DEC) LEN(6 0) MIN(1) PROMPT('Num�ro de lot')


/******************************************************************************/
/*  CRTCMD CMD(library/ADDLIBLOT)                                             */
/*           PGM(*LIBL/RMVLIBLOT)                                             */
/*           SRCFILE(library/QCMDSRC)                                         */
/*           SRCMBR(ADDLIBLOT)                                                */
/******************************************************************************/