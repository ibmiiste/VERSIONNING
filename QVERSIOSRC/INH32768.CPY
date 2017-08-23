      /if defined(INH32766_H)
        /eof
      /endif

      /define INH32766_H

      // Attention à bien reprendre les type défini dans la base.
      // une différence de type oblige à passer par 1 variable intermédiaire

       dcl-ds inhert based(nihil);
         entire char( 32768);
         chrstr char( 32768) pos(1);
         r_qualified char(10) pos(1);
       end-ds;

