/as sysdba

alter session set "_ORACLE_SCRIPT" = true;

create user Furniture identified by size 
    default tablespace users 
    temporary tablespace temp;

grant connect, resource to Furniture;

alter user Furniture QUOTA 1G on users;