--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.9

-- Started on 2018-06-14 21:06:20 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12390)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 32770)
-- Name: calendario; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.calendario (
    id_fecha integer NOT NULL,
    fecha date,
    descripcion text,
    recurrente boolean
);


ALTER TABLE public.calendario OWNER TO mortal2018;

--
-- TOC entry 186 (class 1259 OID 32776)
-- Name: calendario_excepcion; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.calendario_excepcion (
    id_excepcion integer NOT NULL,
    fecha date NOT NULL,
    estado boolean,
    descripcion text
);


ALTER TABLE public.calendario_excepcion OWNER TO mortal2018;

--
-- TOC entry 187 (class 1259 OID 32782)
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.calendario_excepcion_id_excepcion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendario_excepcion_id_excepcion_seq OWNER TO mortal2018;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 187
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.calendario_excepcion_id_excepcion_seq OWNED BY public.calendario_excepcion.id_excepcion;


--
-- TOC entry 188 (class 1259 OID 32784)
-- Name: calendario_id_fecha_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.calendario_id_fecha_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendario_id_fecha_seq OWNER TO mortal2018;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 188
-- Name: calendario_id_fecha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.calendario_id_fecha_seq OWNED BY public.calendario.id_fecha;


--
-- TOC entry 189 (class 1259 OID 32786)
-- Name: diagnostico; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.diagnostico OWNER TO mortal2018;

--
-- TOC entry 190 (class 1259 OID 32792)
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnostico_id_diagnostico_seq OWNER TO mortal2018;

--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 190
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.diagnostico_id_diagnostico_seq OWNED BY public.diagnostico.id_diagnostico;


--
-- TOC entry 191 (class 1259 OID 32794)
-- Name: diagnostico_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.diagnostico_parte (
    id_diagnostico_parte integer NOT NULL,
    id_diagnostico integer,
    id_parte integer
);


ALTER TABLE public.diagnostico_parte OWNER TO mortal2018;

--
-- TOC entry 192 (class 1259 OID 32797)
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.diagnostico_parte_id_diagnostico_parte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnostico_parte_id_diagnostico_parte_seq OWNER TO mortal2018;

--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 192
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.diagnostico_parte_id_diagnostico_parte_seq OWNED BY public.diagnostico_parte.id_diagnostico_parte;


--
-- TOC entry 193 (class 1259 OID 32799)
-- Name: equipo; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.equipo (
    id_equipo integer NOT NULL,
    no_inventario character varying(20) NOT NULL,
    observaciones text,
    id_marca integer,
    responsable character varying(200),
    fecha_ingreso date
);


ALTER TABLE public.equipo OWNER TO mortal2018;

--
-- TOC entry 194 (class 1259 OID 32805)
-- Name: equipo_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.equipo_detalle (
    id_equipo integer NOT NULL,
    id_parte integer NOT NULL,
    id_equipo_detalle bigint NOT NULL,
    id_modelo integer,
    id_marca integer,
    activo boolean,
    n_inventario character varying(200),
    serie character varying(200),
    caracteristicas text
);


ALTER TABLE public.equipo_detalle OWNER TO mortal2018;

--
-- TOC entry 195 (class 1259 OID 32811)
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.equipo_detalle_id_equipo_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_detalle_id_equipo_detalle_seq OWNER TO mortal2018;

--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 195
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.equipo_detalle_id_equipo_detalle_seq OWNED BY public.equipo_detalle.id_equipo_detalle;


--
-- TOC entry 196 (class 1259 OID 32813)
-- Name: equipo_id_equipo_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.equipo_id_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_id_equipo_seq OWNER TO mortal2018;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 196
-- Name: equipo_id_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.equipo_id_equipo_seq OWNED BY public.equipo.id_equipo;


--
-- TOC entry 197 (class 1259 OID 32815)
-- Name: equipo_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.equipo_parte (
    id_equipo integer NOT NULL,
    id_parte integer NOT NULL
);


ALTER TABLE public.equipo_parte OWNER TO mortal2018;

--
-- TOC entry 198 (class 1259 OID 32818)
-- Name: estado; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.estado (
    id_estado integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    descripcion text
);


ALTER TABLE public.estado OWNER TO mortal2018;

--
-- TOC entry 199 (class 1259 OID 32824)
-- Name: estado_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_estado_seq OWNER TO mortal2018;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 199
-- Name: estado_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.estado_id_estado_seq OWNED BY public.estado.id_estado;


--
-- TOC entry 200 (class 1259 OID 32826)
-- Name: estado_mantenimiento_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.estado_mantenimiento_detalle (
    id_estado_mantenimiento_detalle integer NOT NULL,
    id_mantenimiento_detalle integer,
    id_estado integer,
    id_responsable integer,
    id_paso integer
);


ALTER TABLE public.estado_mantenimiento_detalle OWNER TO mortal2018;

--
-- TOC entry 201 (class 1259 OID 32829)
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq OWNER TO mortal2018;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq OWNED BY public.estado_mantenimiento_detalle.id_estado_mantenimiento_detalle;


--
-- TOC entry 202 (class 1259 OID 32831)
-- Name: mantenimiento_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.mantenimiento_detalle (
    id_mantenimiento_detalle bigint NOT NULL,
    id_equipo_detalle integer,
    id_oden_trabajo integer
);


ALTER TABLE public.mantenimiento_detalle OWNER TO mortal2018;

--
-- TOC entry 203 (class 1259 OID 32834)
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.mantenimiento_detalle_id_mantenimiento_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mantenimiento_detalle_id_mantenimiento_detalle_seq OWNER TO mortal2018;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 203
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.mantenimiento_detalle_id_mantenimiento_detalle_seq OWNED BY public.mantenimiento_detalle.id_mantenimiento_detalle;


--
-- TOC entry 204 (class 1259 OID 32836)
-- Name: marca; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    nombre character varying(50),
    activo boolean,
    descripcion text
);


ALTER TABLE public.marca OWNER TO mortal2018;

--
-- TOC entry 205 (class 1259 OID 32842)
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.marca_id_marca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_id_marca_seq OWNER TO mortal2018;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 205
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.marca_id_marca_seq OWNED BY public.marca.id_marca;


--
-- TOC entry 206 (class 1259 OID 32844)
-- Name: modelo; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.modelo (
    id_modelo integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    descripcion text
);


ALTER TABLE public.modelo OWNER TO mortal2018;

--
-- TOC entry 207 (class 1259 OID 32850)
-- Name: modelo_id_modelo_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.modelo_id_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_id_modelo_seq OWNER TO mortal2018;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 207
-- Name: modelo_id_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.modelo_id_modelo_seq OWNED BY public.modelo.id_modelo;


--
-- TOC entry 208 (class 1259 OID 32852)
-- Name: orden; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.orden (
    id_orden integer NOT NULL,
    fecha date,
    observaciones text,
    activo boolean,
    id_solicitud integer,
    id_unidad integer
);


ALTER TABLE public.orden OWNER TO mortal2018;

--
-- TOC entry 209 (class 1259 OID 32858)
-- Name: orden_calendario; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.orden_calendario (
    id_orden_calendario integer NOT NULL,
    id_fecha integer,
    id_orden integer
);


ALTER TABLE public.orden_calendario OWNER TO mortal2018;

--
-- TOC entry 210 (class 1259 OID 32861)
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.orden_calendario_id_orden_calendario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_calendario_id_orden_calendario_seq OWNER TO mortal2018;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 210
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.orden_calendario_id_orden_calendario_seq OWNED BY public.orden_calendario.id_orden_calendario;


--
-- TOC entry 211 (class 1259 OID 32863)
-- Name: orden_id_orden_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.orden_id_orden_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_id_orden_seq OWNER TO mortal2018;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 211
-- Name: orden_id_orden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.orden_id_orden_seq OWNED BY public.orden.id_orden;


--
-- TOC entry 212 (class 1259 OID 32865)
-- Name: orden_trabajo_equipo; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.orden_trabajo_equipo (
    id_orden_trabajo integer NOT NULL,
    fecha_inicio date,
    fecha_estimada date,
    id_orden integer,
    id_equipo integer,
    id_tipo_mantenimiento integer,
    id_prioridad integer
);


ALTER TABLE public.orden_trabajo_equipo OWNER TO mortal2018;

--
-- TOC entry 213 (class 1259 OID 32868)
-- Name: orden_trabajo_equipo_detalle; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.orden_trabajo_equipo_detalle (
    id_orden_trabajo_equipo_detalle integer NOT NULL,
    id_orden_trabajo integer,
    id_equipo integer,
    id_parte integer,
    id_usuario integer,
    id_rol integer
);


ALTER TABLE public.orden_trabajo_equipo_detalle OWNER TO mortal2018;

--
-- TOC entry 214 (class 1259 OID 32871)
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq OWNER TO mortal2018;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 214
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq OWNED BY public.orden_trabajo_equipo_detalle.id_orden_trabajo_equipo_detalle;


--
-- TOC entry 215 (class 1259 OID 32873)
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.orden_trabajo_equipo_id_orden_trabajo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_trabajo_equipo_id_orden_trabajo_seq OWNER TO mortal2018;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 215
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.orden_trabajo_equipo_id_orden_trabajo_seq OWNED BY public.orden_trabajo_equipo.id_orden_trabajo;


--
-- TOC entry 216 (class 1259 OID 32875)
-- Name: parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.parte (
    id_parte integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    id_tipo_parte integer
);


ALTER TABLE public.parte OWNER TO mortal2018;

--
-- TOC entry 217 (class 1259 OID 32881)
-- Name: parte_id_parte_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.parte_id_parte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parte_id_parte_seq OWNER TO mortal2018;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 217
-- Name: parte_id_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.parte_id_parte_seq OWNED BY public.parte.id_parte;


--
-- TOC entry 218 (class 1259 OID 32883)
-- Name: paso; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.paso (
    id_paso integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    id_procedimiento integer
);


ALTER TABLE public.paso OWNER TO mortal2018;

--
-- TOC entry 219 (class 1259 OID 32889)
-- Name: paso_id_paso_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.paso_id_paso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paso_id_paso_seq OWNER TO mortal2018;

--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 219
-- Name: paso_id_paso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.paso_id_paso_seq OWNED BY public.paso.id_paso;


--
-- TOC entry 220 (class 1259 OID 32891)
-- Name: prioridad; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.prioridad (
    id_prioridad integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE public.prioridad OWNER TO mortal2018;

--
-- TOC entry 221 (class 1259 OID 32897)
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.prioridad_id_prioridad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prioridad_id_prioridad_seq OWNER TO mortal2018;

--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 221
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.prioridad_id_prioridad_seq OWNED BY public.prioridad.id_prioridad;


--
-- TOC entry 222 (class 1259 OID 32899)
-- Name: procedimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.procedimiento (
    id_procedimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    descripcion text,
    id_diagnostico integer
);


ALTER TABLE public.procedimiento OWNER TO mortal2018;

--
-- TOC entry 223 (class 1259 OID 32905)
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.procedimiento_id_procedimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.procedimiento_id_procedimiento_seq OWNER TO mortal2018;

--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.procedimiento_id_procedimiento_seq OWNED BY public.procedimiento.id_procedimiento;


--
-- TOC entry 224 (class 1259 OID 32907)
-- Name: responsable; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.responsable (
    id_responsable integer NOT NULL,
    nombre character varying(50),
    activo boolean,
    descripcion text,
    id_tipo_responsable integer
);


ALTER TABLE public.responsable OWNER TO mortal2018;

--
-- TOC entry 225 (class 1259 OID 32913)
-- Name: responsable_id_responsable_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.responsable_id_responsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responsable_id_responsable_seq OWNER TO mortal2018;

--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 225
-- Name: responsable_id_responsable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.responsable_id_responsable_seq OWNED BY public.responsable.id_responsable;


--
-- TOC entry 226 (class 1259 OID 32915)
-- Name: solicitud; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.solicitud (
    id_solicitud integer NOT NULL,
    solicitante character varying(255),
    fecha_solicitud date,
    activo boolean
);


ALTER TABLE public.solicitud OWNER TO mortal2018;

--
-- TOC entry 227 (class 1259 OID 32918)
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.solicitud_id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_id_solicitud_seq OWNER TO mortal2018;

--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 227
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.solicitud_id_solicitud_seq OWNED BY public.solicitud.id_solicitud;


--
-- TOC entry 228 (class 1259 OID 32920)
-- Name: sub_tipo_mantenimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.sub_tipo_mantenimiento (
    id_sub_tipo_mantenimiento integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.sub_tipo_mantenimiento OWNER TO mortal2018;

--
-- TOC entry 229 (class 1259 OID 32926)
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq OWNER TO mortal2018;

--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 229
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq OWNED BY public.sub_tipo_mantenimiento.id_sub_tipo_mantenimiento;


--
-- TOC entry 230 (class 1259 OID 32928)
-- Name: tipo_mantenimiento; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.tipo_mantenimiento (
    id_tipo_mantenimiento integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descipcion text,
    activo boolean,
    id_sub_tipo_mantenimiento integer
);


ALTER TABLE public.tipo_mantenimiento OWNER TO mortal2018;

--
-- TOC entry 231 (class 1259 OID 32934)
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.tipo_mantenimiento_id_tipo_mantenimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_mantenimiento_id_tipo_mantenimiento_seq OWNER TO mortal2018;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.tipo_mantenimiento_id_tipo_mantenimiento_seq OWNED BY public.tipo_mantenimiento.id_tipo_mantenimiento;


--
-- TOC entry 232 (class 1259 OID 32936)
-- Name: tipo_parte; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.tipo_parte (
    id_tipo_parte integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.tipo_parte OWNER TO mortal2018;

--
-- TOC entry 233 (class 1259 OID 32942)
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.tipo_parte_id_tipo_parte_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_parte_id_tipo_parte_seq OWNER TO mortal2018;

--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.tipo_parte_id_tipo_parte_seq OWNED BY public.tipo_parte.id_tipo_parte;


--
-- TOC entry 234 (class 1259 OID 32944)
-- Name: tipo_responsable; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.tipo_responsable (
    id_tipo_responsable integer NOT NULL,
    nombre character varying(50),
    descripciont text
);


ALTER TABLE public.tipo_responsable OWNER TO mortal2018;

--
-- TOC entry 235 (class 1259 OID 32950)
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.tipo_responsable_id_tipo_responsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_responsable_id_tipo_responsable_seq OWNER TO mortal2018;

--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.tipo_responsable_id_tipo_responsable_seq OWNED BY public.tipo_responsable.id_tipo_responsable;


--
-- TOC entry 236 (class 1259 OID 32952)
-- Name: unidad; Type: TABLE; Schema: public; Owner: mortal2018
--

CREATE TABLE public.unidad (
    id_unidad integer NOT NULL,
    nombre character varying(50) NOT NULL,
    codigo character varying
);


ALTER TABLE public.unidad OWNER TO mortal2018;

--
-- TOC entry 237 (class 1259 OID 32958)
-- Name: unidad_id_unidad_seq; Type: SEQUENCE; Schema: public; Owner: mortal2018
--

CREATE SEQUENCE public.unidad_id_unidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_id_unidad_seq OWNER TO mortal2018;

--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 237
-- Name: unidad_id_unidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2018
--

ALTER SEQUENCE public.unidad_id_unidad_seq OWNED BY public.unidad.id_unidad;


--
-- TOC entry 2175 (class 2604 OID 32960)
-- Name: calendario id_fecha; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.calendario ALTER COLUMN id_fecha SET DEFAULT nextval('public.calendario_id_fecha_seq'::regclass);


--
-- TOC entry 2176 (class 2604 OID 32961)
-- Name: calendario_excepcion id_excepcion; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.calendario_excepcion ALTER COLUMN id_excepcion SET DEFAULT nextval('public.calendario_excepcion_id_excepcion_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 32962)
-- Name: diagnostico id_diagnostico; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('public.diagnostico_id_diagnostico_seq'::regclass);


--
-- TOC entry 2178 (class 2604 OID 32963)
-- Name: diagnostico_parte id_diagnostico_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.diagnostico_parte ALTER COLUMN id_diagnostico_parte SET DEFAULT nextval('public.diagnostico_parte_id_diagnostico_parte_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 32964)
-- Name: equipo id_equipo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo ALTER COLUMN id_equipo SET DEFAULT nextval('public.equipo_id_equipo_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 32965)
-- Name: equipo_detalle id_equipo_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo_detalle ALTER COLUMN id_equipo_detalle SET DEFAULT nextval('public.equipo_detalle_id_equipo_detalle_seq'::regclass);


--
-- TOC entry 2181 (class 2604 OID 32966)
-- Name: estado id_estado; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado ALTER COLUMN id_estado SET DEFAULT nextval('public.estado_id_estado_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 32967)
-- Name: estado_mantenimiento_detalle id_estado_mantenimiento_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado_mantenimiento_detalle ALTER COLUMN id_estado_mantenimiento_detalle SET DEFAULT nextval('public.estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 32968)
-- Name: mantenimiento_detalle id_mantenimiento_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.mantenimiento_detalle ALTER COLUMN id_mantenimiento_detalle SET DEFAULT nextval('public.mantenimiento_detalle_id_mantenimiento_detalle_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 32969)
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.marca ALTER COLUMN id_marca SET DEFAULT nextval('public.marca_id_marca_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 32970)
-- Name: modelo id_modelo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id_modelo SET DEFAULT nextval('public.modelo_id_modelo_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 33161)
-- Name: orden id_orden; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden ALTER COLUMN id_orden SET DEFAULT nextval('public.orden_id_orden_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 32972)
-- Name: orden_calendario id_orden_calendario; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_calendario ALTER COLUMN id_orden_calendario SET DEFAULT nextval('public.orden_calendario_id_orden_calendario_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 32973)
-- Name: orden_trabajo_equipo id_orden_trabajo; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo ALTER COLUMN id_orden_trabajo SET DEFAULT nextval('public.orden_trabajo_equipo_id_orden_trabajo_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 32974)
-- Name: orden_trabajo_equipo_detalle id_orden_trabajo_equipo_detalle; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo_detalle ALTER COLUMN id_orden_trabajo_equipo_detalle SET DEFAULT nextval('public.orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 32975)
-- Name: parte id_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.parte ALTER COLUMN id_parte SET DEFAULT nextval('public.parte_id_parte_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 32976)
-- Name: paso id_paso; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.paso ALTER COLUMN id_paso SET DEFAULT nextval('public.paso_id_paso_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 32977)
-- Name: prioridad id_prioridad; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.prioridad ALTER COLUMN id_prioridad SET DEFAULT nextval('public.prioridad_id_prioridad_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 32978)
-- Name: procedimiento id_procedimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.procedimiento ALTER COLUMN id_procedimiento SET DEFAULT nextval('public.procedimiento_id_procedimiento_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 32979)
-- Name: responsable id_responsable; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.responsable ALTER COLUMN id_responsable SET DEFAULT nextval('public.responsable_id_responsable_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 32980)
-- Name: solicitud id_solicitud; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.solicitud ALTER COLUMN id_solicitud SET DEFAULT nextval('public.solicitud_id_solicitud_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 32981)
-- Name: sub_tipo_mantenimiento id_sub_tipo_mantenimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.sub_tipo_mantenimiento ALTER COLUMN id_sub_tipo_mantenimiento SET DEFAULT nextval('public.sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 32982)
-- Name: tipo_mantenimiento id_tipo_mantenimiento; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_mantenimiento ALTER COLUMN id_tipo_mantenimiento SET DEFAULT nextval('public.tipo_mantenimiento_id_tipo_mantenimiento_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 32983)
-- Name: tipo_parte id_tipo_parte; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_parte ALTER COLUMN id_tipo_parte SET DEFAULT nextval('public.tipo_parte_id_tipo_parte_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 32984)
-- Name: tipo_responsable id_tipo_responsable; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_responsable ALTER COLUMN id_tipo_responsable SET DEFAULT nextval('public.tipo_responsable_id_tipo_responsable_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 32985)
-- Name: unidad id_unidad; Type: DEFAULT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.unidad ALTER COLUMN id_unidad SET DEFAULT nextval('public.unidad_id_unidad_seq'::regclass);


--
-- TOC entry 2396 (class 0 OID 32770)
-- Dependencies: 185
-- Data for Name: calendario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.calendario (id_fecha, fecha, descripcion, recurrente) FROM stdin;
1	2018-05-10	dia de la madre	t
2	2018-06-17	dia del padre	t
3	2018-06-22	dia del maestro	t
4	2018-11-01	dia de los difuntos	t
\.


--
-- TOC entry 2397 (class 0 OID 32776)
-- Dependencies: 186
-- Data for Name: calendario_excepcion; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.calendario_excepcion (id_excepcion, fecha, estado, descripcion) FROM stdin;
1	2018-05-10	t	dia de la madre
2	2018-06-17	t	dia del padre
3	2018-06-22	t	dia del maestro
\.


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 187
-- Name: calendario_excepcion_id_excepcion_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.calendario_excepcion_id_excepcion_seq', 1, false);


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 188
-- Name: calendario_id_fecha_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.calendario_id_fecha_seq', 1, false);


--
-- TOC entry 2400 (class 0 OID 32786)
-- Dependencies: 189
-- Data for Name: diagnostico; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.diagnostico (id_diagnostico, nombre, descripcion) FROM stdin;
1	irreparable	articulo sin solucion
2	reparable	articulo con solucion
3	en buen estado	articulo sin danos
4	reparacion rapida	artico con poco dano
\.


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 190
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.diagnostico_id_diagnostico_seq', 1, false);


--
-- TOC entry 2402 (class 0 OID 32794)
-- Dependencies: 191
-- Data for Name: diagnostico_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.diagnostico_parte (id_diagnostico_parte, id_diagnostico, id_parte) FROM stdin;
1	1	2
2	2	1
3	1	3
\.


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 192
-- Name: diagnostico_parte_id_diagnostico_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.diagnostico_parte_id_diagnostico_parte_seq', 1, false);


--
-- TOC entry 2404 (class 0 OID 32799)
-- Dependencies: 193
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.equipo (id_equipo, no_inventario, observaciones, id_marca, responsable, fecha_ingreso) FROM stdin;
1	0001	impresor	1	ingenieria	2018-06-12
2	0002	monitor	2	fisica	2018-06-26
3	0003	pc	5	letras	2018-06-12
4	0004	usb	3	idiomas	2018-07-01
5	0005	pc	5	letras	2018-07-15
6	0006	usb	1	idiomas	2018-06-14
7	0007	pc	6	letras	2018-07-26
8	0008	monitor	4	ingenieria	2018-07-26
9	0009	impresor	2	idiomas	2018-07-29
10	0010	pc	5	letras	2018-07-29
\.


--
-- TOC entry 2405 (class 0 OID 32805)
-- Dependencies: 194
-- Data for Name: equipo_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.equipo_detalle (id_equipo, id_parte, id_equipo_detalle, id_modelo, id_marca, activo, n_inventario, serie, caracteristicas) FROM stdin;
1	1	1	1	1	t	000001	DRT879	caract
2	2	2	2	2	t	000002	FTD859	caract
1	2	3	1	5	t	000003	WER7998	caract
\.


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 195
-- Name: equipo_detalle_id_equipo_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.equipo_detalle_id_equipo_detalle_seq', 1, false);


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 196
-- Name: equipo_id_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.equipo_id_equipo_seq', 1, false);


--
-- TOC entry 2408 (class 0 OID 32815)
-- Dependencies: 197
-- Data for Name: equipo_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.equipo_parte (id_equipo, id_parte) FROM stdin;
1	1
1	2
2	1
2	2
\.


--
-- TOC entry 2409 (class 0 OID 32818)
-- Dependencies: 198
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.estado (id_estado, nombre, activo, descripcion) FROM stdin;
1	activo	t	estado activo
2	inactivo	f	estado inanctivo
\.


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 199
-- Name: estado_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.estado_id_estado_seq', 1, false);


--
-- TOC entry 2411 (class 0 OID 32826)
-- Dependencies: 200
-- Data for Name: estado_mantenimiento_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.estado_mantenimiento_detalle (id_estado_mantenimiento_detalle, id_mantenimiento_detalle, id_estado, id_responsable, id_paso) FROM stdin;
1	2	1	2	1
2	1	2	1	2
3	3	1	2	1
4	2	2	3	1
5	1	1	2	3
\.


--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 201
-- Name: estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.estado_mantenimiento_detalle_id_estado_mantenimiento_detall_seq', 1, false);


--
-- TOC entry 2413 (class 0 OID 32831)
-- Dependencies: 202
-- Data for Name: mantenimiento_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.mantenimiento_detalle (id_mantenimiento_detalle, id_equipo_detalle, id_oden_trabajo) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
\.


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 203
-- Name: mantenimiento_detalle_id_mantenimiento_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.mantenimiento_detalle_id_mantenimiento_detalle_seq', 1, false);


--
-- TOC entry 2415 (class 0 OID 32836)
-- Dependencies: 204
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.marca (id_marca, nombre, activo, descripcion) FROM stdin;
1	HP	t	marca hp
2	Compaq	t	marca compaq
3	Sony	t	marca sony
4	Apple	t	marca aaple
5	Samsung	t	marca samsung
6	Cannon	t	marca cannon
7	Epson	t	marca epson
8	Toshiba	t	marca toshiba
\.


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 205
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.marca_id_marca_seq', 1, false);


--
-- TOC entry 2417 (class 0 OID 32844)
-- Dependencies: 206
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.modelo (id_modelo, nombre, activo, descripcion) FROM stdin;
1	X555l	t	modelo laptop
2	IM2324	t	modelo impresora
3	MQ2322	t	modelo proyector
4	AU24453	f	modelo grabadora
5	DF45453	t	modelo monitor
6	CP34332	t	modelo cpu
7	CD78877	t	modelo cpu
8	OP3344	t	modelo regulador
9	ER3454	t	modelo calculadora
10	MM3554	t	modelo usb
\.


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 207
-- Name: modelo_id_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.modelo_id_modelo_seq', 1, false);


--
-- TOC entry 2419 (class 0 OID 32852)
-- Dependencies: 208
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.orden (id_orden, fecha, observaciones, activo, id_solicitud, id_unidad) FROM stdin;
2	2018-06-19	mantto tradicional	t	2	1
4	2018-06-26	mantto tradicional	t	4	2
5	2018-06-27	mantto regular	t	5	3
6	2018-06-29	mantto precentivo	t	6	4
1	2018-06-23	mantto preventivo	f	1	3
3	2018-06-26	mantto programado	f	3	2
\.


--
-- TOC entry 2420 (class 0 OID 32858)
-- Dependencies: 209
-- Data for Name: orden_calendario; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.orden_calendario (id_orden_calendario, id_fecha, id_orden) FROM stdin;
1	1	1
2	2	2
3	1	3
4	2	4
\.


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 210
-- Name: orden_calendario_id_orden_calendario_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.orden_calendario_id_orden_calendario_seq', 1, false);


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 211
-- Name: orden_id_orden_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.orden_id_orden_seq', 1, false);


--
-- TOC entry 2423 (class 0 OID 32865)
-- Dependencies: 212
-- Data for Name: orden_trabajo_equipo; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.orden_trabajo_equipo (id_orden_trabajo, fecha_inicio, fecha_estimada, id_orden, id_equipo, id_tipo_mantenimiento, id_prioridad) FROM stdin;
1	2018-04-15	2018-06-25	1	1	1	1
2	2018-06-15	2018-06-23	2	2	2	2
3	2018-06-25	2018-07-12	3	1	1	1
4	2018-06-29	2018-07-15	4	2	1	3
\.


--
-- TOC entry 2424 (class 0 OID 32868)
-- Dependencies: 213
-- Data for Name: orden_trabajo_equipo_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.orden_trabajo_equipo_detalle (id_orden_trabajo_equipo_detalle, id_orden_trabajo, id_equipo, id_parte, id_usuario, id_rol) FROM stdin;
1	1	1	2	1	2
2	1	1	1	1	1
\.


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 214
-- Name: orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.orden_trabajo_equipo_detalle_id_orden_trabajo_equipo_detall_seq', 1, false);


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 215
-- Name: orden_trabajo_equipo_id_orden_trabajo_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.orden_trabajo_equipo_id_orden_trabajo_seq', 1, false);


--
-- TOC entry 2427 (class 0 OID 32875)
-- Dependencies: 216
-- Data for Name: parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.parte (id_parte, nombre, descripcion, id_tipo_parte) FROM stdin;
1	Memoria Ram	memoria	1
3	Mouse	mouse	1
2	Memoria usb	memoria	1
4	antivirus	programa	2
\.


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 217
-- Name: parte_id_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.parte_id_parte_seq', 1, false);


--
-- TOC entry 2429 (class 0 OID 32883)
-- Dependencies: 218
-- Data for Name: paso; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.paso (id_paso, nombre, descripcion, id_procedimiento) FROM stdin;
1	cambiar piezas	cambio deuna pieza	1
2	reparar pieza	reparacion de pieza	2
3	cambiar placa	cambio de placa	2
4	cmabio de panatalla	cambio de pantall	4
\.


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 219
-- Name: paso_id_paso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.paso_id_paso_seq', 1, false);


--
-- TOC entry 2431 (class 0 OID 32891)
-- Dependencies: 220
-- Data for Name: prioridad; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.prioridad (id_prioridad, nombre, descripcion, activo) FROM stdin;
1	urgente	demanda alta	t
2	estandar	uso medio	t
3	leve	poco uso 	t
\.


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 221
-- Name: prioridad_id_prioridad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.prioridad_id_prioridad_seq', 1, false);


--
-- TOC entry 2433 (class 0 OID 32899)
-- Dependencies: 222
-- Data for Name: procedimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.procedimiento (id_procedimiento, nombre, activo, descripcion, id_diagnostico) FROM stdin;
1	evaluar	t	evaluacion	1
2	investigar	t	investigacion	2
3	reparar	t	reparacion	4
4	eliminar	t	desecho 	1
\.


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 223
-- Name: procedimiento_id_procedimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.procedimiento_id_procedimiento_seq', 1, false);


--
-- TOC entry 2435 (class 0 OID 32907)
-- Dependencies: 224
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.responsable (id_responsable, nombre, activo, descripcion, id_tipo_responsable) FROM stdin;
1	Juan Perez	t	ingeniero	1
2	Carlos Castro	t	tecnico	2
3	Jose Vides	t	estudiante	3
4	Luis Doratt	f	ingeniero	1
5	Erick Flores	t	tecnico	1
6	Alex Monzon	t	estudiante	3
\.


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 225
-- Name: responsable_id_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.responsable_id_responsable_seq', 1, false);


--
-- TOC entry 2437 (class 0 OID 32915)
-- Dependencies: 226
-- Data for Name: solicitud; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.solicitud (id_solicitud, solicitante, fecha_solicitud, activo) FROM stdin;
1	Depto Letras	2018-06-15	f
2	Depto  CSS	2018-06-15	t
3	Depto Idiomas	2018-06-16	t
4	Depto Fisica	2018-06-17	f
5	Depto Ingenieria	2018-06-19	t
6	Decanato	2018-06-21	t
\.


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 227
-- Name: solicitud_id_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.solicitud_id_solicitud_seq', 1, false);


--
-- TOC entry 2439 (class 0 OID 32920)
-- Dependencies: 228
-- Data for Name: sub_tipo_mantenimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.sub_tipo_mantenimiento (id_sub_tipo_mantenimiento, nombre, descripcion) FROM stdin;
1	correctivo	mantto correctivo
2	preventivo	mantto preventivo
3	correctivo/preventivo	ambos tipos
\.


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 229
-- Name: sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.sub_tipo_mantenimiento_id_sub_tipo_mantenimiento_seq', 1, false);


--
-- TOC entry 2441 (class 0 OID 32928)
-- Dependencies: 230
-- Data for Name: tipo_mantenimiento; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.tipo_mantenimiento (id_tipo_mantenimiento, nombre, descipcion, activo, id_sub_tipo_mantenimiento) FROM stdin;
1	programado	mantoo programado	t	1
2	no programado	mantto no programdo	t	2
\.


--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 231
-- Name: tipo_mantenimiento_id_tipo_mantenimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.tipo_mantenimiento_id_tipo_mantenimiento_seq', 1, false);


--
-- TOC entry 2443 (class 0 OID 32936)
-- Dependencies: 232
-- Data for Name: tipo_parte; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.tipo_parte (id_tipo_parte, nombre, descripcion) FROM stdin;
1	hardware	parte de hardware
2	software	parte de software
\.


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 233
-- Name: tipo_parte_id_tipo_parte_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.tipo_parte_id_tipo_parte_seq', 1, false);


--
-- TOC entry 2445 (class 0 OID 32944)
-- Dependencies: 234
-- Data for Name: tipo_responsable; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.tipo_responsable (id_tipo_responsable, nombre, descripciont) FROM stdin;
1	Ingeniero	jefe
2	Tecnico	tecnico
3	Estudiante	estudiante
\.


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_responsable_id_tipo_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.tipo_responsable_id_tipo_responsable_seq', 1, false);


--
-- TOC entry 2447 (class 0 OID 32952)
-- Dependencies: 236
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: mortal2018
--

COPY public.unidad (id_unidad, nombre, codigo) FROM stdin;
1	Ingenieria	0001
2	Letras	0002
3	Idiomas	0003
4	Psicologia	0004
5	Fisica	0005
6	Matematica	0006
7	Decanato	0007
\.


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 237
-- Name: unidad_id_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2018
--

SELECT pg_catalog.setval('public.unidad_id_unidad_seq', 1, false);


--
-- TOC entry 2230 (class 2606 OID 32987)
-- Name: orden_trabajo_equipo ok_orden_trabajo_equipo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo
    ADD CONSTRAINT ok_orden_trabajo_equipo PRIMARY KEY (id_orden_trabajo);


--
-- TOC entry 2202 (class 2606 OID 32989)
-- Name: calendario pk_calendario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.calendario
    ADD CONSTRAINT pk_calendario PRIMARY KEY (id_fecha);


--
-- TOC entry 2204 (class 2606 OID 32991)
-- Name: calendario_excepcion pk_calendario_excepcion; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.calendario_excepcion
    ADD CONSTRAINT pk_calendario_excepcion PRIMARY KEY (id_excepcion);


--
-- TOC entry 2206 (class 2606 OID 32993)
-- Name: diagnostico pk_diagnostico; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT pk_diagnostico PRIMARY KEY (id_diagnostico);


--
-- TOC entry 2208 (class 2606 OID 32995)
-- Name: diagnostico_parte pk_diagnostico_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.diagnostico_parte
    ADD CONSTRAINT pk_diagnostico_parte PRIMARY KEY (id_diagnostico_parte);


--
-- TOC entry 2210 (class 2606 OID 32997)
-- Name: equipo pk_equipo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo
    ADD CONSTRAINT pk_equipo PRIMARY KEY (id_equipo);


--
-- TOC entry 2212 (class 2606 OID 32999)
-- Name: equipo_detalle pk_equipo_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo_detalle
    ADD CONSTRAINT pk_equipo_detalle PRIMARY KEY (id_equipo, id_parte);


--
-- TOC entry 2214 (class 2606 OID 33001)
-- Name: equipo_parte pk_equipo_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo_parte
    ADD CONSTRAINT pk_equipo_parte PRIMARY KEY (id_equipo, id_parte);


--
-- TOC entry 2216 (class 2606 OID 33003)
-- Name: estado pk_estado; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (id_estado);


--
-- TOC entry 2218 (class 2606 OID 33005)
-- Name: estado_mantenimiento_detalle pk_estado_mantenimiento_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado_mantenimiento_detalle
    ADD CONSTRAINT pk_estado_mantenimiento_detalle PRIMARY KEY (id_estado_mantenimiento_detalle);


--
-- TOC entry 2220 (class 2606 OID 33007)
-- Name: mantenimiento_detalle pk_mantenimiento_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.mantenimiento_detalle
    ADD CONSTRAINT pk_mantenimiento_detalle PRIMARY KEY (id_mantenimiento_detalle);


--
-- TOC entry 2222 (class 2606 OID 33009)
-- Name: marca pk_marca; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (id_marca);


--
-- TOC entry 2224 (class 2606 OID 33011)
-- Name: modelo pk_modelo; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT pk_modelo PRIMARY KEY (id_modelo);


--
-- TOC entry 2226 (class 2606 OID 33163)
-- Name: orden pk_orden; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT pk_orden PRIMARY KEY (id_orden);


--
-- TOC entry 2228 (class 2606 OID 33015)
-- Name: orden_calendario pk_orden_calendario; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_calendario
    ADD CONSTRAINT pk_orden_calendario PRIMARY KEY (id_orden_calendario);


--
-- TOC entry 2232 (class 2606 OID 33017)
-- Name: orden_trabajo_equipo_detalle pk_orden_trabajo_equipo_detalle; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo_detalle
    ADD CONSTRAINT pk_orden_trabajo_equipo_detalle PRIMARY KEY (id_orden_trabajo_equipo_detalle);


--
-- TOC entry 2234 (class 2606 OID 33019)
-- Name: parte pk_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.parte
    ADD CONSTRAINT pk_parte PRIMARY KEY (id_parte);


--
-- TOC entry 2236 (class 2606 OID 33021)
-- Name: paso pk_paso; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.paso
    ADD CONSTRAINT pk_paso PRIMARY KEY (id_paso);


--
-- TOC entry 2238 (class 2606 OID 33023)
-- Name: prioridad pk_prioridad; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.prioridad
    ADD CONSTRAINT pk_prioridad PRIMARY KEY (id_prioridad);


--
-- TOC entry 2240 (class 2606 OID 33025)
-- Name: procedimiento pk_procedimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.procedimiento
    ADD CONSTRAINT pk_procedimiento PRIMARY KEY (id_procedimiento);


--
-- TOC entry 2242 (class 2606 OID 33027)
-- Name: responsable pk_rsponsable; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT pk_rsponsable PRIMARY KEY (id_responsable);


--
-- TOC entry 2244 (class 2606 OID 33029)
-- Name: solicitud pk_solicitud; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.solicitud
    ADD CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud);


--
-- TOC entry 2246 (class 2606 OID 33031)
-- Name: sub_tipo_mantenimiento pk_sub_tipo_mantenimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.sub_tipo_mantenimiento
    ADD CONSTRAINT pk_sub_tipo_mantenimiento PRIMARY KEY (id_sub_tipo_mantenimiento);


--
-- TOC entry 2248 (class 2606 OID 33033)
-- Name: tipo_mantenimiento pk_tipo_mantenimiento; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_mantenimiento
    ADD CONSTRAINT pk_tipo_mantenimiento PRIMARY KEY (id_tipo_mantenimiento);


--
-- TOC entry 2250 (class 2606 OID 33035)
-- Name: tipo_parte pk_tipo_parte; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_parte
    ADD CONSTRAINT pk_tipo_parte PRIMARY KEY (id_tipo_parte);


--
-- TOC entry 2252 (class 2606 OID 33037)
-- Name: tipo_responsable pk_tipo_responsable; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_responsable
    ADD CONSTRAINT pk_tipo_responsable PRIMARY KEY (id_tipo_responsable);


--
-- TOC entry 2254 (class 2606 OID 33039)
-- Name: unidad pk_unidad; Type: CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT pk_unidad PRIMARY KEY (id_unidad);


--
-- TOC entry 2255 (class 2606 OID 33040)
-- Name: diagnostico_parte fk_diagnostico_parte_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.diagnostico_parte
    ADD CONSTRAINT fk_diagnostico_parte_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES public.diagnostico(id_diagnostico) MATCH FULL;


--
-- TOC entry 2256 (class 2606 OID 33045)
-- Name: diagnostico_parte fk_diagnostico_parte_parte; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.diagnostico_parte
    ADD CONSTRAINT fk_diagnostico_parte_parte FOREIGN KEY (id_parte) REFERENCES public.parte(id_parte) MATCH FULL;


--
-- TOC entry 2257 (class 2606 OID 33050)
-- Name: equipo_detalle fk_equipo_detalle_marca; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo_detalle
    ADD CONSTRAINT fk_equipo_detalle_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) MATCH FULL;


--
-- TOC entry 2258 (class 2606 OID 33055)
-- Name: equipo_detalle fk_equipo_detalle_modelo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo_detalle
    ADD CONSTRAINT fk_equipo_detalle_modelo FOREIGN KEY (id_modelo) REFERENCES public.modelo(id_modelo) MATCH FULL;


--
-- TOC entry 2259 (class 2606 OID 33060)
-- Name: equipo_parte fk_equipo_parte_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.equipo_parte
    ADD CONSTRAINT fk_equipo_parte_equipo FOREIGN KEY (id_equipo) REFERENCES public.equipo(id_equipo) MATCH FULL;


--
-- TOC entry 2260 (class 2606 OID 33065)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_estado; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_estado FOREIGN KEY (id_estado) REFERENCES public.estado(id_estado) MATCH FULL;


--
-- TOC entry 2261 (class 2606 OID 33070)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_mantenimiento_detalle; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_mantenimiento_detalle FOREIGN KEY (id_mantenimiento_detalle) REFERENCES public.mantenimiento_detalle(id_mantenimiento_detalle) MATCH FULL;


--
-- TOC entry 2262 (class 2606 OID 33075)
-- Name: estado_mantenimiento_detalle fk_estado_mantenimiento_detalle_responsable; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.estado_mantenimiento_detalle
    ADD CONSTRAINT fk_estado_mantenimiento_detalle_responsable FOREIGN KEY (id_responsable) REFERENCES public.responsable(id_responsable) MATCH FULL;


--
-- TOC entry 2263 (class 2606 OID 33080)
-- Name: mantenimiento_detalle fk_mantenimiento_detalle_orden_trabajo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.mantenimiento_detalle
    ADD CONSTRAINT fk_mantenimiento_detalle_orden_trabajo_equipo FOREIGN KEY (id_oden_trabajo) REFERENCES public.orden_trabajo_equipo(id_orden_trabajo) MATCH FULL;


--
-- TOC entry 2266 (class 2606 OID 33085)
-- Name: orden_calendario fk_orden_calendario_calendario; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_calendario
    ADD CONSTRAINT fk_orden_calendario_calendario FOREIGN KEY (id_fecha) REFERENCES public.calendario(id_fecha) MATCH FULL;


--
-- TOC entry 2267 (class 2606 OID 33164)
-- Name: orden_calendario fk_orden_calendario_orden; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_calendario
    ADD CONSTRAINT fk_orden_calendario_orden FOREIGN KEY (id_orden) REFERENCES public.orden(id_orden) MATCH FULL;


--
-- TOC entry 2264 (class 2606 OID 33095)
-- Name: orden fk_orden_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_orden_solicitud FOREIGN KEY (id_solicitud) REFERENCES public.solicitud(id_solicitud) MATCH FULL;


--
-- TOC entry 2272 (class 2606 OID 33100)
-- Name: orden_trabajo_equipo_detalle fk_orden_trabajo_equipo_detalle_equipo_detalle; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo_detalle
    ADD CONSTRAINT fk_orden_trabajo_equipo_detalle_equipo_detalle FOREIGN KEY (id_equipo, id_parte) REFERENCES public.equipo_detalle(id_equipo, id_parte) MATCH FULL;


--
-- TOC entry 2273 (class 2606 OID 33105)
-- Name: orden_trabajo_equipo_detalle fk_orden_trabajo_equipo_detalle_orden_trabajo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo_detalle
    ADD CONSTRAINT fk_orden_trabajo_equipo_detalle_orden_trabajo_equipo FOREIGN KEY (id_orden_trabajo) REFERENCES public.orden_trabajo_equipo(id_orden_trabajo) MATCH FULL;


--
-- TOC entry 2268 (class 2606 OID 33110)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_equipo; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_equipo FOREIGN KEY (id_equipo) REFERENCES public.equipo(id_equipo) MATCH FULL;


--
-- TOC entry 2271 (class 2606 OID 33169)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_orden; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_orden FOREIGN KEY (id_orden) REFERENCES public.orden(id_orden) MATCH FULL;


--
-- TOC entry 2269 (class 2606 OID 33120)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_prioridad; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_prioridad FOREIGN KEY (id_prioridad) REFERENCES public.prioridad(id_prioridad) MATCH FULL;


--
-- TOC entry 2270 (class 2606 OID 33125)
-- Name: orden_trabajo_equipo fk_orden_trabajo_equipo_tipo_mantenimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden_trabajo_equipo
    ADD CONSTRAINT fk_orden_trabajo_equipo_tipo_mantenimiento FOREIGN KEY (id_tipo_mantenimiento) REFERENCES public.tipo_mantenimiento(id_tipo_mantenimiento) MATCH FULL;


--
-- TOC entry 2265 (class 2606 OID 33130)
-- Name: orden fk_orden_unidad; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_orden_unidad FOREIGN KEY (id_unidad) REFERENCES public.unidad(id_unidad) MATCH FULL;


--
-- TOC entry 2274 (class 2606 OID 33135)
-- Name: parte fk_parte_tipo_parte; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.parte
    ADD CONSTRAINT fk_parte_tipo_parte FOREIGN KEY (id_tipo_parte) REFERENCES public.tipo_parte(id_tipo_parte) MATCH FULL;


--
-- TOC entry 2275 (class 2606 OID 33140)
-- Name: paso fk_paso_procedimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.paso
    ADD CONSTRAINT fk_paso_procedimiento FOREIGN KEY (id_procedimiento) REFERENCES public.procedimiento(id_procedimiento) MATCH FULL;


--
-- TOC entry 2276 (class 2606 OID 33145)
-- Name: procedimiento fk_procedimiento_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.procedimiento
    ADD CONSTRAINT fk_procedimiento_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES public.diagnostico(id_diagnostico) MATCH FULL;


--
-- TOC entry 2277 (class 2606 OID 33150)
-- Name: responsable fk_responsable_tipo_responsable; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT fk_responsable_tipo_responsable FOREIGN KEY (id_tipo_responsable) REFERENCES public.tipo_responsable(id_tipo_responsable) MATCH FULL;


--
-- TOC entry 2278 (class 2606 OID 33155)
-- Name: tipo_mantenimiento fk_tipo_mantenimiento_sub_tipo_mantenimiento; Type: FK CONSTRAINT; Schema: public; Owner: mortal2018
--

ALTER TABLE ONLY public.tipo_mantenimiento
    ADD CONSTRAINT fk_tipo_mantenimiento_sub_tipo_mantenimiento FOREIGN KEY (id_sub_tipo_mantenimiento) REFERENCES public.sub_tipo_mantenimiento(id_sub_tipo_mantenimiento) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-06-14 21:06:20 UTC

--
-- PostgreSQL database dump complete
--

