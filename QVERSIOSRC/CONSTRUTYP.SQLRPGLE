      * >>PRE-COMPILER<<                                              */
      *   >>CRTCMD<<  CRTSQLRPGI SRCFILE(&SL/&SF) SRCMBR(&SM);        */
      *   >>COMPILE<<                                                 */
      *     >>PARM<<  OBJ(&LI/&OB);                                   */
      *     >>PARM<<  OBJTYPE(*MODULE);                               */
      *     >>PARM<<  OPTION(*EVENTF);                                */
      *     >>PARM<<  RPGPPOPT(*LVL2);                                */
      *     >>PARM<<  CLOSQLCSR(*ENDACTGRP);                          */
      *     >>PARM<<  DATFMT(*ISO);                                   */
      *     >>PARM<<  TIMFMT(*ISO);                                   */
      *     >>PARM<<  COMPILEOPT(&U0);                                */
      *   >>END-COMPILE<<                                             */
      *   >>CMD<<  DSPFD FILE(QGPL/*ALL) TYPE(*MBRLIST) +             */
      *                  OUTPUT(*OUTFILE) FILEATR(*ALL) +             */
      *                   OUTFILE(QTEMP/LISTMEMBER);                  */
      *   >>EXECUTE<<                                                 */
      *   >>CMD<<  DLTF FILE(LISTMEMBER);                             */
      * >>END-PRE-COMPILER<<                                          */
       ctl-opt nomain;
      /copy qversiosrc,cpyctlstm

       dcl-pr creation;
         USESRCBIB like(r_qualified);
         USESRCFILE like(r_qualified);
         USESRCMBR like(r_qualified);
         LIB like(r_qualified);
         OBJ like(r_qualified);
         SRCLIB like(r_qualified);
         SRCFILE like(r_qualified);
         SRCMBR like(r_qualified);
       End-Pr;

      // Héritage des données
      /copy qversiosrc,INH32768

       dcl-proc ordonnanceur_construction export ;
       dcl-pi ordonnanceur_construction like(sqlcode) end-pi;
       dcl-s retour like(sqlcode);
       dcl-s g_type_source like(r_qualified);
       dcl-ds ds_listmember extname('LISTMEMBER') qualified End-Ds;


         exec sql DECLARE C_ordre CURSOR FOR SELECT Type_source
                                               FROM ORDONNANCE
                                               ORDER BY ordre;

         exec sql open c_ordre;

         exec sql FETCH FROM C_ORDRE INTO :g_type_source;

         dow sqlcode=0;
         exec sql DECLARE C_source CURSOR FOR SELECT MLLIB,
                                                     MLFILE,
                                                     MLNAME
                                               FROM LISTMEMBER
                                               where MLSEU2=:g_type_source;


           exec sql open c_source;

           exec sql FETCH FROM C_source INTO :ds_listmember.MLLIB,
                                             :ds_listmember.MLFILE,
                                             :ds_listmember.MLNAME;
           dow sqlcode=0;

           creation( ds_listmember.MLLIB
                    :ds_listmember.MLFILE
                    :ds_listmember.MLNAME
                    :ds_listmember.MLLIB
                    :ds_listmember.MLNAME
                    :ds_listmember.MLLIB
                    :ds_listmember.MLFILE
                    :ds_listmember.MLNAME);

             exec sql FETCH FROM C_source INTO :ds_listmember;
           enddo;

           exec sql FETCH FROM C_ORDRE INTO :g_type_source;
         EndDo;

         return retour;

       end-proc;





