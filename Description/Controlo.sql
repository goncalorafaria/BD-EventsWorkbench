CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'funcionariopassword';

GRANT SELECT,UPDATE,INSERT,CALL ON Workbench.* TO 'funcionario'@'localhost;

###

CREATE USER 'organizador'@'localhost' IDENTIFIED BY 'organizadorpassword';
# Especificar em detalhe quais os procedures
GRANT CALL ON Workbench.* TO 'organizador'@'localhost;

GRANT SELECT ON (Workbench.Locais,Workbench.Plataforma) TO 'organizador'@'localhost;

###

CREATE USER 'participante'@'localhost' IDENTIFIED BY 'participantepassword';

GRANT CALL ON Workbench.* TO 'participante'@'localhost;

###

CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'Adminpassword';

GRANT ALL PRIVILEGES ON Workbench.* TO 'Admin'@'localhost;

