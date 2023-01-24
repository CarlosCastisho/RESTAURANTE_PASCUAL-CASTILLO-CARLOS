create schema if not exists Restaurante;
use Restaurante;

create table TBL_EMPLEADO (
ID_EMPLEADO int auto_increment not null primary key,
EMP_NOMBRE varchar(50) not null,
EMP_APELLIDO varchar(50) not null,
ID_SUCURSAL int not null,
ID_CARGO int not null,
EMP_SALARIO decimal(9,3) not null,
ID_JORNA_TRABAJO int not null,
F_NACIMIENTO date not null,
EMP_DIRECCION varchar(60) not null,
EMP_CELULAR varchar(10) not null unique,
EMP_CORREO varchar(50) not null,
foreign key (ID_SUCURSAL) references TBL_SUCURSAL(ID_SUCURSAL),
foreign key (ID_CARGO) references TBL_CARGOS(ID_CARGO),
foreign key (ID_JORNA_TRABAJO) references TBL_REG_JORNADA_TRABAJO(ID_JORNA_TRABAJO)
);

create table TBL_CARGOS (
ID_CARGO int auto_increment not null primary key,
LEN_CARGO varchar(25) not null,
COMEM_CARGO varchar(50)
);

create table TBL_REG_JORNADA_TRABAJO (
ID_JORNA_TRABAJO int auto_increment not null primary key,
HORA_ENTRADA datetime not null,
HORA_SALIDA datetime not null,
ID_EMPLEADO int not null,
foreign key (ID_EMPLEADO) references TBL_EMPLEADO(ID_EMPLEADO)
);

create table TBL_SUCURSAL(
ID_SUCURSAL int auto_increment not null primary key,
SUC_NOMBRE varchar(45) not null,
SUC_DIRECCION varchar(45) not null,
SUC_TELEFONO varchar(25) not null unique
);

create table TBL_MESAS(
ID_MESAS int auto_increment not null primary key,
ID_SUCURSAL int not null,
CAPACIDAD int not null,
foreign key (ID_SUCURSAL) references TBL_SUCURSAL(ID_SUCURSAL)
);

create table TBL_CLIENTES(
ID_CLIENTE int auto_increment not null primary key,
CLIENT_NOMBRE varchar(50) not null,
CLIENT_APELLIDO varchar(50) not null,
CLIENT_CELULAR varchar(10) not null
);

create table TBL_RESERVACIONES(
ID_RESERVA int auto_increment not null primary key,
ID_MESAS int not null,
ID_CLIENTE int not null,
FECHA_HORA datetime not null,
foreign key (ID_MESAS) references TBL_MESAS(ID_MESAS),
foreign key (ID_CLIENTE) references TBL_CLIENTES(ID_CLIENTE)
);

create table TBL_ORDENES(
ID_ORDEN int auto_increment not null primary key,
ID_MESAS int not null,
ID_RESERVA int not null,
ID_PLATO int not null,
foreign key (ID_MESAS) references TBL_MESAS(ID_MESAS),
foreign key (ID_RESERVA) references TBL_RESERVACIONES(ID_RESERVA),
foreign key (ID_PLATO) references TBL_PLATO(ID_PLATO)
);

create table TBL_PLATO(
ID_PLATO int auto_increment not null primary key,
PLATO_NOMBRE varchar(40) not null unique,
PLATO_DESCRIP varchar(100) not null,
ID_CATEGORIA int not null,
foreign key (ID_CATEGORIA) references TBL_CATEGORIA(ID_CATEGORIA)
);

create table TBL_CATEGORIA(
ID_CATEGORIA int auto_increment not null primary key,
CATEGORIA varchar(40) not null
);

create table TBL_FACTURA(
ID_FACTURA int auto_increment not null primary key,
FAC_FECHA date not null,
/*ID_IVA int not null,*/
FAC_TOTAL_PAGO numeric(8,2),
ID_FORMA_PAGO int not null,
ID_CLIENTE int not null,
/*foreign key (ID_IVA) references TBL_IVA(ID_IVA),*/
foreign key (ID_FORMA_PAGO) references TBL_FORMA_PAGO(ID_FORMA_PAGO),
foreign key (ID_CLIENTE) references TBL_CLIENTES(ID_CLIENTE)
);

/*create table TBL_IVA(
ID_IVA int auto_increment not null primary key,
);*/

create table TBL_FORMA_PAGO(
ID_FORMA_PAGO int auto_increment not null primary key,
DESCRI_F_PAGO varchar(20)
);