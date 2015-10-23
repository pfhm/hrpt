--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO epiwork;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO epiwork;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO epiwork;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO epiwork;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO epiwork;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO epiwork;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO epiwork;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO epiwork;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO epiwork;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO epiwork;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO epiwork;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO epiwork;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO epiwork;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO epiwork;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE captcha_captchastore (
    id integer NOT NULL,
    challenge character varying(32) NOT NULL,
    response character varying(32) NOT NULL,
    hashkey character varying(40) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.captcha_captchastore OWNER TO epiwork;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE captcha_captchastore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.captcha_captchastore_id_seq OWNER TO epiwork;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE captcha_captchastore_id_seq OWNED BY captcha_captchastore.id;


--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_cmsplugin (
    language character varying(15) NOT NULL,
    "position" smallint,
    creation_date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    plugin_type character varying(50) NOT NULL,
    parent_id integer,
    tree_id integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    level integer NOT NULL,
    placeholder_id integer,
    CONSTRAINT ck_level_pstv_428ad4a8 CHECK ((level >= 0)),
    CONSTRAINT ck_lft_pstv_72265402 CHECK ((lft >= 0)),
    CONSTRAINT ck_rght_pstv_7a410590 CHECK ((rght >= 0)),
    CONSTRAINT ck_tree_id_pstv_70924f20 CHECK ((tree_id >= 0)),
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO epiwork;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO epiwork;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_globalpagepermission (
    can_publish boolean NOT NULL,
    group_id integer,
    can_moderate boolean NOT NULL,
    can_change boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_recover_page boolean NOT NULL,
    can_add boolean NOT NULL,
    user_id integer,
    can_delete boolean NOT NULL,
    can_move_page boolean NOT NULL,
    id integer NOT NULL,
    can_change_advanced_settings boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO epiwork;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO epiwork;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO epiwork;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO epiwork;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_page (
    rght integer NOT NULL,
    level integer NOT NULL,
    navigation_extenders character varying(80),
    parent_id integer,
    reverse_id character varying(40),
    login_required boolean NOT NULL,
    soft_root boolean NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    publication_end_date timestamp with time zone,
    template character varying(100) NOT NULL,
    tree_id integer NOT NULL,
    publication_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    id integer NOT NULL,
    moderator_state smallint NOT NULL,
    published boolean NOT NULL,
    site_id integer NOT NULL,
    changed_by character varying(70) NOT NULL,
    created_by character varying(70) NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_state smallint NOT NULL,
    publisher_public_id integer,
    limit_visibility_in_menu smallint,
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO epiwork;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO epiwork;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO epiwork;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO epiwork;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagemoderator; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_pagemoderator (
    moderate_page boolean NOT NULL,
    moderate_children boolean NOT NULL,
    page_id integer NOT NULL,
    user_id integer NOT NULL,
    id integer NOT NULL,
    moderate_descendants boolean NOT NULL
);


ALTER TABLE public.cms_pagemoderator OWNER TO epiwork;

--
-- Name: cms_pagemoderator_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_pagemoderator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderator_id_seq OWNER TO epiwork;

--
-- Name: cms_pagemoderator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_pagemoderator_id_seq OWNED BY cms_pagemoderator.id;


--
-- Name: cms_pagemoderatorstate; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_pagemoderatorstate (
    created timestamp with time zone NOT NULL,
    page_id integer NOT NULL,
    user_id integer,
    action character varying(3),
    message text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.cms_pagemoderatorstate OWNER TO epiwork;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_pagemoderatorstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderatorstate_id_seq OWNER TO epiwork;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_pagemoderatorstate_id_seq OWNED BY cms_pagemoderatorstate.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_pagepermission (
    group_id integer,
    can_publish boolean NOT NULL,
    page_id integer,
    user_id integer,
    id integer NOT NULL,
    can_delete boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_moderate boolean NOT NULL,
    can_add boolean NOT NULL,
    grant_on integer NOT NULL,
    can_move_page boolean NOT NULL,
    can_change boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL
);


ALTER TABLE public.cms_pagepermission OWNER TO epiwork;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO epiwork;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO epiwork;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO epiwork;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_placeholder (
    slot character varying(50) NOT NULL,
    id integer NOT NULL,
    default_width smallint,
    CONSTRAINT ck_default_width_pstv_292fc5fe CHECK ((default_width >= 0)),
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO epiwork;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO epiwork;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cms_title (
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    page_id integer NOT NULL,
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    slug character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    application_urls character varying(200),
    redirect character varying(255),
    meta_keywords character varying(255),
    meta_description text,
    page_title character varying(255),
    menu_title character varying(255)
);


ALTER TABLE public.cms_title OWNER TO epiwork;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO epiwork;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cmsplugin_contestplugin; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_contestplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_contestplugin OWNER TO epiwork;

--
-- Name: cmsplugin_file; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_file (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.cmsplugin_file OWNER TO epiwork;

--
-- Name: cmsplugin_latestentryplugin; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_latestentryplugin (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    "limit" integer NOT NULL,
    CONSTRAINT cmsplugin_latestentryplugin_limit_check CHECK (("limit" >= 0))
);


ALTER TABLE public.cmsplugin_latestentryplugin OWNER TO epiwork;

--
-- Name: cmsplugin_link; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_link (
    url character varying(200),
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(256) NOT NULL,
    page_link_id integer,
    mailto character varying(75)
);


ALTER TABLE public.cmsplugin_link OWNER TO epiwork;

--
-- Name: cmsplugin_picture; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_picture (
    url character varying(255),
    image character varying(100) NOT NULL,
    cmsplugin_ptr_id integer NOT NULL,
    alt character varying(255),
    page_link_id integer,
    "float" character varying(10),
    longdesc character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_picture OWNER TO epiwork;

--
-- Name: cmsplugin_snippetptr; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_snippetptr (
    cmsplugin_ptr_id integer NOT NULL,
    snippet_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_snippetptr OWNER TO epiwork;

--
-- Name: cmsplugin_surveychartplugin; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_surveychartplugin (
    cmsplugin_ptr_id integer NOT NULL,
    chart_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_surveychartplugin OWNER TO epiwork;

--
-- Name: cmsplugin_text; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE cmsplugin_text (
    body text NOT NULL,
    cmsplugin_ptr_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_text OWNER TO epiwork;

--
-- Name: contest_prediction; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE contest_prediction (
    id integer NOT NULL,
    user_id integer NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.contest_prediction OWNER TO epiwork;

--
-- Name: contest_prediction_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE contest_prediction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_prediction_id_seq OWNER TO epiwork;

--
-- Name: contest_prediction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE contest_prediction_id_seq OWNED BY contest_prediction.id;


--
-- Name: contest_week; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE contest_week (
    id integer NOT NULL,
    number integer NOT NULL,
    value character varying(6),
    prediction_id integer NOT NULL
);


ALTER TABLE public.contest_week OWNER TO epiwork;

--
-- Name: contest_week_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE contest_week_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contest_week_id_seq OWNER TO epiwork;

--
-- Name: contest_week_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE contest_week_id_seq OWNED BY contest_week.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO epiwork;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO epiwork;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_cache; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE django_cache (
    cache_key character varying(255) NOT NULL,
    value text NOT NULL,
    expires timestamp with time zone NOT NULL
);


ALTER TABLE public.django_cache OWNER TO epiwork;

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO epiwork;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO epiwork;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO epiwork;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO epiwork;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO epiwork;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: journal_category; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE journal_category (
    id integer NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.journal_category OWNER TO epiwork;

--
-- Name: journal_category_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE journal_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_category_id_seq OWNER TO epiwork;

--
-- Name: journal_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE journal_category_id_seq OWNED BY journal_category.id;


--
-- Name: journal_categorytranslation; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE journal_categorytranslation (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer
);


ALTER TABLE public.journal_categorytranslation OWNER TO epiwork;

--
-- Name: journal_categorytranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE journal_categorytranslation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_categorytranslation_id_seq OWNER TO epiwork;

--
-- Name: journal_categorytranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE journal_categorytranslation_id_seq OWNED BY journal_categorytranslation.id;


--
-- Name: journal_entry; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE journal_entry (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    is_published boolean NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    category_id integer,
    image character varying(100),
    alignment character varying(5)
);


ALTER TABLE public.journal_entry OWNER TO epiwork;

--
-- Name: journal_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE journal_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_entry_id_seq OWNER TO epiwork;

--
-- Name: journal_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE journal_entry_id_seq OWNED BY journal_entry.id;


--
-- Name: journal_entrytranslation; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE journal_entrytranslation (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    excerpt text NOT NULL,
    content text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer
);


ALTER TABLE public.journal_entrytranslation OWNER TO epiwork;

--
-- Name: journal_entrytranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE journal_entrytranslation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_entrytranslation_id_seq OWNER TO epiwork;

--
-- Name: journal_entrytranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE journal_entrytranslation_id_seq OWNED BY journal_entrytranslation.id;


--
-- Name: journal_latestentryplugin_category; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE journal_latestentryplugin_category (
    id integer NOT NULL,
    latestentryplugin_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.journal_latestentryplugin_category OWNER TO epiwork;

--
-- Name: journal_latestentryplugin_category_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE journal_latestentryplugin_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_latestentryplugin_category_id_seq OWNER TO epiwork;

--
-- Name: journal_latestentryplugin_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE journal_latestentryplugin_category_id_seq OWNED BY journal_latestentryplugin_category.id;


--
-- Name: loginurl_key; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE loginurl_key (
    id integer NOT NULL,
    user_id integer NOT NULL,
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    usage_left integer,
    expires timestamp with time zone,
    next character varying(200)
);


ALTER TABLE public.loginurl_key OWNER TO epiwork;

--
-- Name: loginurl_key_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE loginurl_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loginurl_key_id_seq OWNER TO epiwork;

--
-- Name: loginurl_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE loginurl_key_id_seq OWNED BY loginurl_key.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO epiwork;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO epiwork;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: partnersites_sitesettings; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE partnersites_sitesettings (
    id integer NOT NULL,
    site_id integer NOT NULL,
    light_color character varying(6) NOT NULL,
    logo character varying(100),
    footer text,
    contact_form_recipient character varying(75) NOT NULL
);


ALTER TABLE public.partnersites_sitesettings OWNER TO epiwork;

--
-- Name: partnersites_sitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE partnersites_sitesettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partnersites_sitesettings_id_seq OWNER TO epiwork;

--
-- Name: partnersites_sitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE partnersites_sitesettings_id_seq OWNED BY partnersites_sitesettings.id;


--
-- Name: pollster_chart; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_chart (
    id integer NOT NULL,
    survey_id integer NOT NULL,
    type_id integer NOT NULL,
    shortname character varying(255) NOT NULL,
    chartwrapper text NOT NULL,
    sqlfilter character varying(255) NOT NULL,
    sqlsource text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    status character varying(255) NOT NULL,
    geotable character varying(255) NOT NULL
);


ALTER TABLE public.pollster_chart OWNER TO epiwork;

--
-- Name: pollster_chart_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_chart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_chart_id_seq OWNER TO epiwork;

--
-- Name: pollster_chart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_chart_id_seq OWNED BY pollster_chart.id;


--
-- Name: pollster_charttype; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_charttype (
    id integer NOT NULL,
    shortname character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.pollster_charttype OWNER TO epiwork;

--
-- Name: pollster_charttype_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_charttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_charttype_id_seq OWNER TO epiwork;

--
-- Name: pollster_charttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_charttype_id_seq OWNED BY pollster_charttype.id;


--
-- Name: pollster_option; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_option (
    id integer NOT NULL,
    question_id integer NOT NULL,
    clone_id integer,
    row_id integer,
    column_id integer,
    is_virtual boolean NOT NULL,
    is_open boolean NOT NULL,
    starts_hidden boolean NOT NULL,
    ordinal integer NOT NULL,
    text character varying(4095) NOT NULL,
    "group" character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    virtual_type_id integer,
    virtual_inf character varying(255) NOT NULL,
    virtual_sup character varying(255) NOT NULL,
    virtual_regex character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.pollster_option OWNER TO epiwork;

--
-- Name: pollster_option_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_option_id_seq OWNER TO epiwork;

--
-- Name: pollster_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_option_id_seq OWNED BY pollster_option.id;


--
-- Name: pollster_question; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_question (
    id integer NOT NULL,
    survey_id integer NOT NULL,
    starts_hidden boolean NOT NULL,
    is_mandatory boolean NOT NULL,
    ordinal integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    type character varying(255) NOT NULL,
    data_type_id integer NOT NULL,
    open_option_data_type_id integer,
    data_name character varying(255) NOT NULL,
    visual character varying(255) NOT NULL,
    tags character varying(255) NOT NULL,
    regex character varying(1023) NOT NULL,
    error_message text NOT NULL
);


ALTER TABLE public.pollster_question OWNER TO epiwork;

--
-- Name: pollster_question_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_question_id_seq OWNER TO epiwork;

--
-- Name: pollster_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_question_id_seq OWNED BY pollster_question.id;


--
-- Name: pollster_questioncolumn; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_questioncolumn (
    id integer NOT NULL,
    question_id integer NOT NULL,
    ordinal integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.pollster_questioncolumn OWNER TO epiwork;

--
-- Name: pollster_questioncolumn_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_questioncolumn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_questioncolumn_id_seq OWNER TO epiwork;

--
-- Name: pollster_questioncolumn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_questioncolumn_id_seq OWNED BY pollster_questioncolumn.id;


--
-- Name: pollster_questiondatatype; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_questiondatatype (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    db_type character varying(255) NOT NULL,
    css_class character varying(255) NOT NULL,
    js_class character varying(255) NOT NULL
);


ALTER TABLE public.pollster_questiondatatype OWNER TO epiwork;

--
-- Name: pollster_questiondatatype_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_questiondatatype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_questiondatatype_id_seq OWNER TO epiwork;

--
-- Name: pollster_questiondatatype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_questiondatatype_id_seq OWNED BY pollster_questiondatatype.id;


--
-- Name: pollster_questionrow; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_questionrow (
    id integer NOT NULL,
    question_id integer NOT NULL,
    ordinal integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.pollster_questionrow OWNER TO epiwork;

--
-- Name: pollster_questionrow_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_questionrow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_questionrow_id_seq OWNER TO epiwork;

--
-- Name: pollster_questionrow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_questionrow_id_seq OWNED BY pollster_questionrow.id;


--
-- Name: pollster_rule; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_rule (
    id integer NOT NULL,
    rule_type_id integer NOT NULL,
    subject_question_id integer NOT NULL,
    object_question_id integer,
    is_sufficient boolean NOT NULL
);


ALTER TABLE public.pollster_rule OWNER TO epiwork;

--
-- Name: pollster_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_rule_id_seq OWNER TO epiwork;

--
-- Name: pollster_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_rule_id_seq OWNED BY pollster_rule.id;


--
-- Name: pollster_rule_object_options; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_rule_object_options (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    option_id integer NOT NULL
);


ALTER TABLE public.pollster_rule_object_options OWNER TO epiwork;

--
-- Name: pollster_rule_object_options_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_rule_object_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_rule_object_options_id_seq OWNER TO epiwork;

--
-- Name: pollster_rule_object_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_rule_object_options_id_seq OWNED BY pollster_rule_object_options.id;


--
-- Name: pollster_rule_subject_options; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_rule_subject_options (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    option_id integer NOT NULL
);


ALTER TABLE public.pollster_rule_subject_options OWNER TO epiwork;

--
-- Name: pollster_rule_subject_options_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_rule_subject_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_rule_subject_options_id_seq OWNER TO epiwork;

--
-- Name: pollster_rule_subject_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_rule_subject_options_id_seq OWNED BY pollster_rule_subject_options.id;


--
-- Name: pollster_ruletype; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_ruletype (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    js_class character varying(255) NOT NULL
);


ALTER TABLE public.pollster_ruletype OWNER TO epiwork;

--
-- Name: pollster_ruletype_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_ruletype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_ruletype_id_seq OWNER TO epiwork;

--
-- Name: pollster_ruletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_ruletype_id_seq OWNED BY pollster_ruletype.id;


--
-- Name: pollster_survey; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_survey (
    id integer NOT NULL,
    parent_id integer,
    title character varying(255) NOT NULL,
    shortname character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.pollster_survey OWNER TO epiwork;

--
-- Name: pollster_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_survey_id_seq OWNER TO epiwork;

--
-- Name: pollster_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_survey_id_seq OWNED BY pollster_survey.id;


--
-- Name: pollster_translationoption; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_translationoption (
    id integer NOT NULL,
    translation_id integer NOT NULL,
    option_id integer NOT NULL,
    text character varying(4095) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.pollster_translationoption OWNER TO epiwork;

--
-- Name: pollster_translationoption_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_translationoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_translationoption_id_seq OWNER TO epiwork;

--
-- Name: pollster_translationoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_translationoption_id_seq OWNED BY pollster_translationoption.id;


--
-- Name: pollster_translationquestion; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_translationquestion (
    id integer NOT NULL,
    translation_id integer NOT NULL,
    question_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    error_message text NOT NULL
);


ALTER TABLE public.pollster_translationquestion OWNER TO epiwork;

--
-- Name: pollster_translationquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_translationquestion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_translationquestion_id_seq OWNER TO epiwork;

--
-- Name: pollster_translationquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_translationquestion_id_seq OWNED BY pollster_translationquestion.id;


--
-- Name: pollster_translationquestioncolumn; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_translationquestioncolumn (
    id integer NOT NULL,
    translation_id integer NOT NULL,
    column_id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.pollster_translationquestioncolumn OWNER TO epiwork;

--
-- Name: pollster_translationquestioncolumn_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_translationquestioncolumn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_translationquestioncolumn_id_seq OWNER TO epiwork;

--
-- Name: pollster_translationquestioncolumn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_translationquestioncolumn_id_seq OWNED BY pollster_translationquestioncolumn.id;


--
-- Name: pollster_translationquestionrow; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_translationquestionrow (
    id integer NOT NULL,
    translation_id integer NOT NULL,
    row_id integer NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.pollster_translationquestionrow OWNER TO epiwork;

--
-- Name: pollster_translationquestionrow_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_translationquestionrow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_translationquestionrow_id_seq OWNER TO epiwork;

--
-- Name: pollster_translationquestionrow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_translationquestionrow_id_seq OWNED BY pollster_translationquestionrow.id;


--
-- Name: pollster_translationsurvey; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_translationsurvey (
    id integer NOT NULL,
    survey_id integer NOT NULL,
    language character varying(3) NOT NULL,
    title character varying(255) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.pollster_translationsurvey OWNER TO epiwork;

--
-- Name: pollster_translationsurvey_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_translationsurvey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_translationsurvey_id_seq OWNER TO epiwork;

--
-- Name: pollster_translationsurvey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_translationsurvey_id_seq OWNED BY pollster_translationsurvey.id;


--
-- Name: pollster_virtualoptiontype; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE pollster_virtualoptiontype (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    question_data_type_id integer NOT NULL,
    js_class character varying(255) NOT NULL
);


ALTER TABLE public.pollster_virtualoptiontype OWNER TO epiwork;

--
-- Name: pollster_virtualoptiontype_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE pollster_virtualoptiontype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pollster_virtualoptiontype_id_seq OWNER TO epiwork;

--
-- Name: pollster_virtualoptiontype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE pollster_virtualoptiontype_id_seq OWNED BY pollster_virtualoptiontype.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activation_key character varying(40) NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO epiwork;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO epiwork;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: reminder_newsletter; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_newsletter (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    sender_email character varying(75) NOT NULL,
    sender_name character varying(255) NOT NULL,
    published boolean NOT NULL
);


ALTER TABLE public.reminder_newsletter OWNER TO epiwork;

--
-- Name: reminder_newsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_newsletter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_newsletter_id_seq OWNER TO epiwork;

--
-- Name: reminder_newsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_newsletter_id_seq OWNED BY reminder_newsletter.id;


--
-- Name: reminder_newslettertemplate; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_newslettertemplate (
    id integer NOT NULL,
    is_default_reminder boolean NOT NULL,
    is_default_newsitem boolean NOT NULL,
    sender_email character varying(75) NOT NULL,
    sender_name character varying(255) NOT NULL
);


ALTER TABLE public.reminder_newslettertemplate OWNER TO epiwork;

--
-- Name: reminder_newslettertemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_newslettertemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_newslettertemplate_id_seq OWNER TO epiwork;

--
-- Name: reminder_newslettertemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_newslettertemplate_id_seq OWNED BY reminder_newslettertemplate.id;


--
-- Name: reminder_newslettertemplatetranslation; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_newslettertemplatetranslation (
    id integer NOT NULL,
    subject character varying(255) NOT NULL,
    message text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer
);


ALTER TABLE public.reminder_newslettertemplatetranslation OWNER TO epiwork;

--
-- Name: reminder_newslettertemplatetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_newslettertemplatetranslation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_newslettertemplatetranslation_id_seq OWNER TO epiwork;

--
-- Name: reminder_newslettertemplatetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_newslettertemplatetranslation_id_seq OWNED BY reminder_newslettertemplatetranslation.id;


--
-- Name: reminder_newslettertranslation; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_newslettertranslation (
    id integer NOT NULL,
    subject character varying(255) NOT NULL,
    message text NOT NULL,
    language_code character varying(15) NOT NULL,
    master_id integer
);


ALTER TABLE public.reminder_newslettertranslation OWNER TO epiwork;

--
-- Name: reminder_newslettertranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_newslettertranslation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_newslettertranslation_id_seq OWNER TO epiwork;

--
-- Name: reminder_newslettertranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_newslettertranslation_id_seq OWNED BY reminder_newslettertranslation.id;


--
-- Name: reminder_remindererror; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_remindererror (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    message character varying(255) NOT NULL,
    traceback text NOT NULL
);


ALTER TABLE public.reminder_remindererror OWNER TO epiwork;

--
-- Name: reminder_remindererror_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_remindererror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_remindererror_id_seq OWNER TO epiwork;

--
-- Name: reminder_remindererror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_remindererror_id_seq OWNED BY reminder_remindererror.id;


--
-- Name: reminder_remindersettings; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_remindersettings (
    id integer NOT NULL,
    site_id integer NOT NULL,
    send_reminders boolean NOT NULL,
    begin_date timestamp with time zone,
    "interval" integer,
    currently_sending boolean NOT NULL,
    batch_size integer,
    last_process_started_date timestamp with time zone NOT NULL
);


ALTER TABLE public.reminder_remindersettings OWNER TO epiwork;

--
-- Name: reminder_remindersettings_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_remindersettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_remindersettings_id_seq OWNER TO epiwork;

--
-- Name: reminder_remindersettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_remindersettings_id_seq OWNED BY reminder_remindersettings.id;


--
-- Name: reminder_userreminderinfo; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE reminder_userreminderinfo (
    id integer NOT NULL,
    user_id integer NOT NULL,
    last_reminder timestamp with time zone,
    active boolean NOT NULL,
    language character varying(5)
);


ALTER TABLE public.reminder_userreminderinfo OWNER TO epiwork;

--
-- Name: reminder_userreminderinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE reminder_userreminderinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reminder_userreminderinfo_id_seq OWNER TO epiwork;

--
-- Name: reminder_userreminderinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE reminder_userreminderinfo_id_seq OWNED BY reminder_userreminderinfo.id;


--
-- Name: snippet_snippet; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE snippet_snippet (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    html text NOT NULL,
    template character varying(50) NOT NULL
);


ALTER TABLE public.snippet_snippet OWNER TO epiwork;

--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE snippet_snippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.snippet_snippet_id_seq OWNER TO epiwork;

--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE snippet_snippet_id_seq OWNED BY snippet_snippet.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO epiwork;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO epiwork;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: survey_lastresponse; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_lastresponse (
    id integer NOT NULL,
    user_id integer NOT NULL,
    participation_id integer,
    data text
);


ALTER TABLE public.survey_lastresponse OWNER TO epiwork;

--
-- Name: survey_lastresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_lastresponse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_lastresponse_id_seq OWNER TO epiwork;

--
-- Name: survey_lastresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_lastresponse_id_seq OWNED BY survey_lastresponse.id;


--
-- Name: survey_localflusurvey; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_localflusurvey (
    id integer NOT NULL,
    surveyuser_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    status character varying(8) NOT NULL,
    age_user smallint NOT NULL,
    data text NOT NULL,
    survey_id character varying(50) NOT NULL
);


ALTER TABLE public.survey_localflusurvey OWNER TO epiwork;

--
-- Name: survey_localflusurvey_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_localflusurvey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_localflusurvey_id_seq OWNER TO epiwork;

--
-- Name: survey_localflusurvey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_localflusurvey_id_seq OWNED BY survey_localflusurvey.id;


--
-- Name: survey_localprofile; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_localprofile (
    id integer NOT NULL,
    surveyuser_id integer NOT NULL,
    sq_num_season smallint,
    sq_num_total smallint,
    sq_date_first date,
    sq_date_last date,
    birth_date date NOT NULL,
    zip_code character varying(5) NOT NULL,
    region character varying(30),
    gender character varying(1) NOT NULL,
    a_family smallint NOT NULL,
    a_smoker character varying(1) NOT NULL,
    a_vaccine_prev_seasonal character varying(1) NOT NULL,
    a_vaccine_prev_swine character varying(1) NOT NULL,
    a_vaccine_current character varying(1) NOT NULL
);


ALTER TABLE public.survey_localprofile OWNER TO epiwork;

--
-- Name: survey_localprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_localprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_localprofile_id_seq OWNER TO epiwork;

--
-- Name: survey_localprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_localprofile_id_seq OWNED BY survey_localprofile.id;


--
-- Name: survey_localresponse; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_localresponse (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id character varying(36) NOT NULL,
    survey_id character varying(50) NOT NULL,
    answers text NOT NULL
);


ALTER TABLE public.survey_localresponse OWNER TO epiwork;

--
-- Name: survey_localresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_localresponse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_localresponse_id_seq OWNER TO epiwork;

--
-- Name: survey_localresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_localresponse_id_seq OWNED BY survey_localresponse.id;


--
-- Name: survey_participation; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_participation (
    id integer NOT NULL,
    user_id integer NOT NULL,
    survey_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    epidb_id character varying(36),
    previous_participation_id integer,
    previous_participation_date timestamp with time zone
);


ALTER TABLE public.survey_participation OWNER TO epiwork;

--
-- Name: survey_participation_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_participation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_participation_id_seq OWNER TO epiwork;

--
-- Name: survey_participation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_participation_id_seq OWNED BY survey_participation.id;


--
-- Name: survey_profile; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    valid boolean NOT NULL,
    data text,
    survey_id integer
);


ALTER TABLE public.survey_profile OWNER TO epiwork;

--
-- Name: survey_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_profile_id_seq OWNER TO epiwork;

--
-- Name: survey_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_profile_id_seq OWNED BY survey_profile.id;


--
-- Name: survey_profilesendqueue; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_profilesendqueue (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id character varying(36) NOT NULL,
    survey_id character varying(50) NOT NULL,
    answers text NOT NULL
);


ALTER TABLE public.survey_profilesendqueue OWNER TO epiwork;

--
-- Name: survey_profilesendqueue_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_profilesendqueue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_profilesendqueue_id_seq OWNER TO epiwork;

--
-- Name: survey_profilesendqueue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_profilesendqueue_id_seq OWNED BY survey_profilesendqueue.id;


--
-- Name: survey_responsesendqueue; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_responsesendqueue (
    id integer NOT NULL,
    participation_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id character varying(36) NOT NULL,
    survey_id character varying(50) NOT NULL,
    answers text NOT NULL
);


ALTER TABLE public.survey_responsesendqueue OWNER TO epiwork;

--
-- Name: survey_responsesendqueue_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_responsesendqueue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_responsesendqueue_id_seq OWNER TO epiwork;

--
-- Name: survey_responsesendqueue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_responsesendqueue_id_seq OWNED BY survey_responsesendqueue.id;


--
-- Name: survey_survey; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_survey (
    id integer NOT NULL,
    survey_id character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    specification text NOT NULL
);


ALTER TABLE public.survey_survey OWNER TO epiwork;

--
-- Name: survey_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_survey_id_seq OWNER TO epiwork;

--
-- Name: survey_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_survey_id_seq OWNED BY survey_survey.id;


--
-- Name: survey_surveyidcode; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_surveyidcode (
    id integer NOT NULL,
    surveyuser_global_id character varying(36),
    idcode character varying(10) NOT NULL,
    fodelsedatum character varying(10)
);


ALTER TABLE public.survey_surveyidcode OWNER TO epiwork;

--
-- Name: survey_surveyidcode_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_surveyidcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_surveyidcode_id_seq OWNER TO epiwork;

--
-- Name: survey_surveyidcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_surveyidcode_id_seq OWNED BY survey_surveyidcode.id;


--
-- Name: survey_surveyuser; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE survey_surveyuser (
    id integer NOT NULL,
    global_id character varying(36) NOT NULL,
    last_participation_id integer,
    last_participation_date timestamp with time zone,
    name character varying(100) NOT NULL,
    deleted boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.survey_surveyuser OWNER TO epiwork;

--
-- Name: survey_surveyuser_id_seq; Type: SEQUENCE; Schema: public; Owner: epiwork
--

CREATE SEQUENCE survey_surveyuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_surveyuser_id_seq OWNER TO epiwork;

--
-- Name: survey_surveyuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: epiwork
--

ALTER SEQUENCE survey_surveyuser_id_seq OWNED BY survey_surveyuser.id;



/*

--TODO: uncomment this 

ALTER TABLE survey_surveyidcode
  ADD CONSTRAINT global_id_fk FOREIGN KEY (surveyuser_global_id) REFERENCES survey_surveyuser (global_id)
   ON UPDATE NO ACTION ON DELETE CASCADE;

*/

--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: epiwork; Tablespace:
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO epiwork;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('captcha_captchastore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagemoderator ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderator_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagemoderatorstate ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderatorstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY contest_prediction ALTER COLUMN id SET DEFAULT nextval('contest_prediction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY contest_week ALTER COLUMN id SET DEFAULT nextval('contest_week_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_category ALTER COLUMN id SET DEFAULT nextval('journal_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_categorytranslation ALTER COLUMN id SET DEFAULT nextval('journal_categorytranslation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_entry ALTER COLUMN id SET DEFAULT nextval('journal_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_entrytranslation ALTER COLUMN id SET DEFAULT nextval('journal_entrytranslation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_latestentryplugin_category ALTER COLUMN id SET DEFAULT nextval('journal_latestentryplugin_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY loginurl_key ALTER COLUMN id SET DEFAULT nextval('loginurl_key_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY partnersites_sitesettings ALTER COLUMN id SET DEFAULT nextval('partnersites_sitesettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_chart ALTER COLUMN id SET DEFAULT nextval('pollster_chart_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_charttype ALTER COLUMN id SET DEFAULT nextval('pollster_charttype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_option ALTER COLUMN id SET DEFAULT nextval('pollster_option_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_question ALTER COLUMN id SET DEFAULT nextval('pollster_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_questioncolumn ALTER COLUMN id SET DEFAULT nextval('pollster_questioncolumn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_questiondatatype ALTER COLUMN id SET DEFAULT nextval('pollster_questiondatatype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_questionrow ALTER COLUMN id SET DEFAULT nextval('pollster_questionrow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule ALTER COLUMN id SET DEFAULT nextval('pollster_rule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule_object_options ALTER COLUMN id SET DEFAULT nextval('pollster_rule_object_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule_subject_options ALTER COLUMN id SET DEFAULT nextval('pollster_rule_subject_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_ruletype ALTER COLUMN id SET DEFAULT nextval('pollster_ruletype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_survey ALTER COLUMN id SET DEFAULT nextval('pollster_survey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationoption ALTER COLUMN id SET DEFAULT nextval('pollster_translationoption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestion ALTER COLUMN id SET DEFAULT nextval('pollster_translationquestion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestioncolumn ALTER COLUMN id SET DEFAULT nextval('pollster_translationquestioncolumn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestionrow ALTER COLUMN id SET DEFAULT nextval('pollster_translationquestionrow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationsurvey ALTER COLUMN id SET DEFAULT nextval('pollster_translationsurvey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_virtualoptiontype ALTER COLUMN id SET DEFAULT nextval('pollster_virtualoptiontype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_newsletter ALTER COLUMN id SET DEFAULT nextval('reminder_newsletter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_newslettertemplate ALTER COLUMN id SET DEFAULT nextval('reminder_newslettertemplate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_newslettertemplatetranslation ALTER COLUMN id SET DEFAULT nextval('reminder_newslettertemplatetranslation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_newslettertranslation ALTER COLUMN id SET DEFAULT nextval('reminder_newslettertranslation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_remindererror ALTER COLUMN id SET DEFAULT nextval('reminder_remindererror_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_remindersettings ALTER COLUMN id SET DEFAULT nextval('reminder_remindersettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_userreminderinfo ALTER COLUMN id SET DEFAULT nextval('reminder_userreminderinfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY snippet_snippet ALTER COLUMN id SET DEFAULT nextval('snippet_snippet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_lastresponse ALTER COLUMN id SET DEFAULT nextval('survey_lastresponse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_localflusurvey ALTER COLUMN id SET DEFAULT nextval('survey_localflusurvey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_localprofile ALTER COLUMN id SET DEFAULT nextval('survey_localprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_localresponse ALTER COLUMN id SET DEFAULT nextval('survey_localresponse_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_participation ALTER COLUMN id SET DEFAULT nextval('survey_participation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_profile ALTER COLUMN id SET DEFAULT nextval('survey_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_profilesendqueue ALTER COLUMN id SET DEFAULT nextval('survey_profilesendqueue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_responsesendqueue ALTER COLUMN id SET DEFAULT nextval('survey_responsesendqueue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_survey ALTER COLUMN id SET DEFAULT nextval('survey_survey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_surveyidcode ALTER COLUMN id SET DEFAULT nextval('survey_surveyidcode_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_surveyuser ALTER COLUMN id SET DEFAULT nextval('survey_surveyuser_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add migration history	1	add_migrationhistory
2	Can change migration history	1	change_migrationhistory
3	Can delete migration history	1	delete_migrationhistory
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add message	5	add_message
14	Can change message	5	change_message
15	Can delete message	5	delete_message
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add site	8	add_site
23	Can change site	8	change_site
24	Can delete site	8	delete_site
25	Can add log entry	9	add_logentry
26	Can change log entry	9	change_logentry
27	Can delete log entry	9	delete_logentry
28	Can add registration profile	10	add_registrationprofile
29	Can change registration profile	10	change_registrationprofile
30	Can delete registration profile	10	delete_registrationprofile
31	Can add key	11	add_key
32	Can change key	11	change_key
33	Can delete key	11	delete_key
34	Can add kv store	12	add_kvstore
35	Can change kv store	12	change_kvstore
36	Can delete kv store	12	delete_kvstore
37	Can add placeholder	13	add_placeholder
38	Can change placeholder	13	change_placeholder
39	Can delete placeholder	13	delete_placeholder
40	Can add cms plugin	14	add_cmsplugin
41	Can change cms plugin	14	change_cmsplugin
42	Can delete cms plugin	14	delete_cmsplugin
43	Can add page	15	add_page
44	Can change page	15	change_page
45	Can delete page	15	delete_page
46	Can add PageModerator	16	add_pagemoderator
47	Can change PageModerator	16	change_pagemoderator
48	Can delete PageModerator	16	delete_pagemoderator
49	Can add Page moderator state	17	add_pagemoderatorstate
50	Can change Page moderator state	17	change_pagemoderatorstate
51	Can delete Page moderator state	17	delete_pagemoderatorstate
52	Can add Page global permission	18	add_globalpagepermission
53	Can change Page global permission	18	change_globalpagepermission
54	Can delete Page global permission	18	delete_globalpagepermission
55	Can add Page permission	19	add_pagepermission
56	Can change Page permission	19	change_pagepermission
57	Can delete Page permission	19	delete_pagepermission
58	Can add User (page)	20	add_pageuser
59	Can change User (page)	20	change_pageuser
60	Can delete User (page)	20	delete_pageuser
61	Can add User group (page)	21	add_pageusergroup
62	Can change User group (page)	21	change_pageusergroup
63	Can delete User group (page)	21	delete_pageusergroup
64	Can add title	22	add_title
65	Can change title	22	change_title
66	Can delete title	22	delete_title
67	Can add picture	23	add_picture
68	Can change picture	23	change_picture
69	Can delete picture	23	delete_picture
70	Can add text	24	add_text
71	Can change text	24	change_text
72	Can delete text	24	delete_text
73	Can add Snippet	25	add_snippet
74	Can change Snippet	25	change_snippet
75	Can delete Snippet	25	delete_snippet
76	Can add Snippet	26	add_snippetptr
77	Can change Snippet	26	change_snippetptr
78	Can delete Snippet	26	delete_snippetptr
79	Can add link	27	add_link
80	Can change link	27	change_link
81	Can delete link	27	delete_link
82	Can add file	28	add_file
83	Can change file	28	change_file
84	Can delete file	28	delete_file
85	Can add survey id code	29	add_surveyidcode
86	Can change survey id code	29	change_surveyidcode
87	Can delete survey id code	29	delete_surveyidcode
88	Can add survey user	30	add_surveyuser
89	Can change survey user	30	change_surveyuser
90	Can delete survey user	30	delete_surveyuser
91	Can add survey	31	add_survey
92	Can change survey	31	change_survey
93	Can delete survey	31	delete_survey
94	Can add participation	32	add_participation
95	Can change participation	32	change_participation
96	Can delete participation	32	delete_participation
97	Can add response send queue	33	add_responsesendqueue
98	Can change response send queue	33	change_responsesendqueue
99	Can delete response send queue	33	delete_responsesendqueue
100	Can add profile send queue	34	add_profilesendqueue
101	Can change profile send queue	34	change_profilesendqueue
102	Can delete profile send queue	34	delete_profilesendqueue
103	Can add local response	35	add_localresponse
104	Can change local response	35	change_localresponse
105	Can delete local response	35	delete_localresponse
106	Can add profile	36	add_profile
107	Can change profile	36	change_profile
108	Can delete profile	36	delete_profile
109	Can add last response	37	add_lastresponse
110	Can change last response	37	change_lastresponse
111	Can delete last response	37	delete_lastresponse
112	Can add local profile	38	add_localprofile
113	Can change local profile	38	change_localprofile
114	Can delete local profile	38	delete_localprofile
115	Can add local flu survey	39	add_localflusurvey
116	Can change local flu survey	39	change_localflusurvey
117	Can delete local flu survey	39	delete_localflusurvey
118	Can add user reminder info	40	add_userreminderinfo
119	Can change user reminder info	40	change_userreminderinfo
120	Can delete user reminder info	40	delete_userreminderinfo
121	Can add reminder settings	41	add_remindersettings
122	Can change reminder settings	41	change_remindersettings
123	Can delete reminder settings	41	delete_remindersettings
124	Can add news letter template translation	42	add_newslettertemplatetranslation
125	Can change news letter template translation	42	change_newslettertemplatetranslation
126	Can delete news letter template translation	42	delete_newslettertemplatetranslation
127	Can add news letter template	43	add_newslettertemplate
128	Can change news letter template	43	change_newslettertemplate
129	Can delete news letter template	43	delete_newslettertemplate
130	Can add news letter translation	44	add_newslettertranslation
131	Can change news letter translation	44	change_newslettertranslation
132	Can delete news letter translation	44	delete_newslettertranslation
133	Can add news letter	45	add_newsletter
134	Can change news letter	45	change_newsletter
135	Can delete news letter	45	delete_newsletter
136	Can add reminder error	46	add_remindererror
137	Can change reminder error	46	change_remindererror
138	Can delete reminder error	46	delete_remindererror
139	Can add category translation	47	add_categorytranslation
140	Can change category translation	47	change_categorytranslation
141	Can delete category translation	47	delete_categorytranslation
142	Can add Category	48	add_category
143	Can change Category	48	change_category
144	Can delete Category	48	delete_category
145	Can add entry translation	49	add_entrytranslation
146	Can change entry translation	49	change_entrytranslation
147	Can delete entry translation	49	delete_entrytranslation
148	Can add Entry	50	add_entry
149	Can change Entry	50	change_entry
150	Can delete Entry	50	delete_entry
151	Can add latest entry plugin	51	add_latestentryplugin
152	Can change latest entry plugin	51	change_latestentryplugin
153	Can delete latest entry plugin	51	delete_latestentryplugin
154	Can add Site settings	52	add_sitesettings
155	Can change Site settings	52	change_sitesettings
156	Can delete Site settings	52	delete_sitesettings
157	Can add cache key	53	add_cachekey
158	Can change cache key	53	change_cachekey
159	Can delete cache key	53	delete_cachekey
160	Can add survey	54	add_survey
161	Can change survey	54	change_survey
162	Can delete survey	54	delete_survey
163	Can add rule type	55	add_ruletype
164	Can change rule type	55	change_ruletype
165	Can delete rule type	55	delete_ruletype
166	Can add question data type	56	add_questiondatatype
167	Can change question data type	56	change_questiondatatype
168	Can delete question data type	56	delete_questiondatatype
169	Can add virtual option type	57	add_virtualoptiontype
170	Can change virtual option type	57	change_virtualoptiontype
171	Can delete virtual option type	57	delete_virtualoptiontype
172	Can add question	58	add_question
173	Can change question	58	change_question
174	Can delete question	58	delete_question
175	Can add question row	59	add_questionrow
176	Can change question row	59	change_questionrow
177	Can delete question row	59	delete_questionrow
178	Can add question column	60	add_questioncolumn
179	Can change question column	60	change_questioncolumn
180	Can delete question column	60	delete_questioncolumn
181	Can add option	61	add_option
182	Can change option	61	change_option
183	Can delete option	61	delete_option
184	Can add rule	62	add_rule
185	Can change rule	62	change_rule
186	Can delete rule	62	delete_rule
187	Can add Translation	63	add_translationsurvey
188	Can change Translation	63	change_translationsurvey
189	Can delete Translation	63	delete_translationsurvey
190	Can add translation question	64	add_translationquestion
191	Can change translation question	64	change_translationquestion
192	Can delete translation question	64	delete_translationquestion
193	Can add translation question row	65	add_translationquestionrow
194	Can change translation question row	65	change_translationquestionrow
195	Can delete translation question row	65	delete_translationquestionrow
196	Can add translation question column	66	add_translationquestioncolumn
197	Can change translation question column	66	change_translationquestioncolumn
198	Can delete translation question column	66	delete_translationquestioncolumn
199	Can add translation option	67	add_translationoption
200	Can change translation option	67	change_translationoption
201	Can delete translation option	67	delete_translationoption
202	Can add chart type	68	add_charttype
203	Can change chart type	68	change_charttype
204	Can delete chart type	68	delete_charttype
205	Can add chart	69	add_chart
206	Can change chart	69	change_chart
207	Can delete chart	69	delete_chart
208	Can add survey chart plugin	70	add_surveychartplugin
209	Can change survey chart plugin	70	change_surveychartplugin
210	Can delete survey chart plugin	70	delete_surveychartplugin
211	Can add contest plugin	71	add_contestplugin
212	Can change contest plugin	71	change_contestplugin
213	Can delete contest plugin	71	delete_contestplugin
214	Can add prediction	72	add_prediction
215	Can change prediction	72	change_prediction
216	Can delete prediction	72	delete_prediction
217	Can add week	73	add_week
218	Can change week	73	change_week
219	Can delete week	73	delete_week
220	Can add captcha store	74	add_captchastore
221	Can change captcha store	74	change_captchastore
222	Can delete captcha store	74	delete_captchastore
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_permission_id_seq', 246, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	root			admin@example.com	sha1$e0b6b$8f04eb8188b277e7bc7f3b213916826ff38fce33	t	t	t	2015-10-10 05:29:30.972402+02	2015-10-09 13:47:06.021853+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 2, true);


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
\.


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('captcha_captchastore_id_seq', 1, false);


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_cmsplugin (language, "position", creation_date, id, plugin_type, parent_id, tree_id, lft, rght, level, placeholder_id) FROM stdin;
en	0	2010-01-17 11:36:15+01	1	TextPlugin	\N	1	1	2	0	9
en	0	2010-01-17 11:36:36+01	2	TextPlugin	\N	2	1	2	0	6
sv	7	2011-01-27 14:34:07+01	440	LinkPlugin	406	141	14	15	1	88
sv	4	2010-12-09 14:11:12+01	305	TextPlugin	\N	124	1	16	0	75
sv	\N	2011-11-11 11:33:39+01	738	LinkPlugin	737	206	2	3	1	251
sv	\N	2011-10-31 15:53:18+01	648	LinkPlugin	472	150	4	5	1	37
sv	1	2013-11-05 16:17:59+01	1314	TextPlugin	\N	486	1	2	0	32
sv	\N	2011-03-31 14:30:46+02	569	SnippetPlugin	541	158	18	19	1	94
sv	\N	2011-03-23 09:45:00+01	568	SnippetPlugin	541	158	16	17	1	94
sv	\N	2011-03-23 09:37:12+01	567	LinkPlugin	541	158	14	15	1	94
sv	0	2011-03-15 12:52:44+01	561	TextPlugin	\N	160	1	2	0	103
sv	1	2011-11-09 18:02:49+01	704	SnippetPlugin	451	145	10	11	1	60
sv	\N	2011-01-27 14:25:41+01	431	LinkPlugin	430	144	2	3	1	63
sv	0	2011-01-27 14:25:26+01	430	TextPlugin	\N	144	1	14	0	63
sv	3	2012-01-20 11:31:41+01	1018	TextPlugin	\N	333	1	2	0	285
sv	14	2011-01-27 14:36:00+01	447	LinkPlugin	406	141	28	29	1	88
sv	1	2011-03-31 15:31:20+02	570	LinkPlugin	548	159	2	3	1	106
sv	\N	2011-01-27 14:31:29+01	437	SnippetPlugin	430	144	10	11	1	63
sv	1	2012-01-19 11:46:21+01	1004	TextPlugin	\N	327	1	2	0	286
sv	1	2012-11-19 18:22:41+01	1207	TextPlugin	\N	439	1	6	0	317
sv	0	2011-10-31 15:05:31+01	637	TextPlugin	\N	173	1	10	0	232
sv	\N	2011-01-27 14:29:59+01	436	PicturePlugin	430	144	8	9	1	63
sv	1	2011-10-31 15:20:41+01	643	LinkPlugin	\N	175	1	2	0	230
sv	2	2013-12-09 16:44:42+01	1352	PicturePlugin	\N	504	1	2	0	14
sv	\N	2011-01-27 14:27:20+01	433	LinkPlugin	430	144	6	7	1	63
sv	\N	2011-01-27 14:26:52+01	432	LinkPlugin	430	144	4	5	1	63
sv	\N	2011-11-14 11:47:03+01	761	LinkPlugin	760	210	2	3	1	228
sv	\N	2012-11-19 18:43:19+01	1212	PicturePlugin	1211	441	2	3	1	320
sv	\N	2011-11-14 16:04:13+01	767	LinkPlugin	407	142	14	15	1	89
sv	0	2010-10-28 11:31:04+02	220	TextPlugin	\N	77	1	2	0	30
sv	8	2011-01-27 14:33:49+01	439	LinkPlugin	406	141	12	13	1	88
sv	0	2010-11-02 09:53:13+01	235	TextPlugin	\N	89	1	4	0	3
sv	\N	2010-11-02 09:53:26+01	236	PicturePlugin	235	89	2	3	1	3
sv	0	2012-11-21 11:35:52+01	1222	TextPlugin	\N	444	1	10	0	323
sv	0	2010-11-23 10:09:10+01	268	LinkPlugin	265	108	6	7	1	20
sv	1	2011-01-27 14:35:43+01	446	LinkPlugin	406	141	26	27	1	88
sv	2	2011-01-27 14:35:26+01	445	LinkPlugin	406	141	24	25	1	88
sv	3	2011-01-27 14:35:14+01	444	LinkPlugin	406	141	22	23	1	88
sv	\N	2011-03-10 10:22:31+01	547	LinkPlugin	541	158	12	13	1	94
sv	4	2011-01-27 14:34:56+01	443	LinkPlugin	406	141	20	21	1	88
sv	\N	2011-03-10 10:19:36+01	546	LinkPlugin	541	158	10	11	1	94
sv	5	2011-01-27 14:34:38+01	442	LinkPlugin	406	141	18	19	1	88
sv	6	2011-01-27 14:34:27+01	441	LinkPlugin	406	141	16	17	1	88
sv	9	2011-01-27 14:33:36+01	438	LinkPlugin	406	141	10	11	1	88
sv	10	2011-01-27 14:28:10+01	435	LinkPlugin	406	141	8	9	1	88
sv	11	2011-01-27 14:27:53+01	434	LinkPlugin	406	141	6	7	1	88
sv	0	2010-12-14 12:35:27+01	355	TextPlugin	\N	131	1	8	0	66
sv	6	2011-12-13 12:00:23+01	854	TextPlugin	\N	237	1	2	0	264
sv	\N	2011-11-08 11:57:23+01	684	LinkPlugin	683	189	2	3	1	243
sv	2	2012-03-15 16:01:42+01	1102	TextPlugin	\N	373	1	6	0	284
sv	1	2010-12-09 17:22:26+01	325	LinkPlugin	324	127	2	3	1	25
sv	10	2012-03-16 16:29:04+01	1126	CMSSurveyChartPlugin	\N	395	1	2	0	297
sv	\N	2011-11-09 18:02:05+01	703	SnippetPlugin	430	144	12	13	1	63
sv	3	2011-12-22 14:42:59+01	905	PicturePlugin	898	267	4	5	1	270
sv	7	2012-01-16 18:21:57+01	963	TextPlugin	\N	299	1	6	0	70
sv	3	2011-12-13 12:26:30+01	857	TextPlugin	\N	240	1	2	0	238
sv	0	2010-10-15 15:38:36+02	57	TextPlugin	\N	28	1	6	0	36
sv	6	2011-12-13 12:43:16+01	863	LinkPlugin	860	243	6	7	1	264
sv	0	2011-03-10 10:23:56+01	548	TextPlugin	\N	159	1	10	0	106
sv	1	2012-03-15 16:07:06+01	1108	TextPlugin	\N	377	1	2	0	287
sv	\N	2012-11-12 11:25:40+01	1196	LinkPlugin	265	108	24	25	1	20
sv	1	2012-01-20 11:35:48+01	1019	TextPlugin	\N	334	1	2	0	285
sv	2	2011-12-22 11:51:53+01	898	TextPlugin	\N	267	1	8	0	270
sv	3	2011-12-22 15:07:28+01	911	TextPlugin	\N	274	1	2	0	269
sv	1	2012-01-19 11:42:44+01	992	PicturePlugin	\N	315	1	2	0	283
sv	0	2012-01-19 11:44:44+01	998	TextPlugin	\N	321	1	2	0	287
sv	0	2010-12-09 17:23:15+01	328	TextPlugin	\N	128	1	12	0	26
sv	4	2012-02-21 10:08:29+01	1046	SnippetPlugin	\N	349	1	2	0	286
sv	2	2012-02-23 17:47:06+01	1062	TextPlugin	\N	353	1	2	0	283
sv	6	2013-11-10 11:11:49+01	1342	LinkPlugin	1305	483	16	17	1	14
sv	2	2013-11-05 15:56:14+01	1312	TextPlugin	\N	484	1	2	0	255
sv	\N	2012-11-07 13:31:30+01	1179	LinkPlugin	1044	347	2	3	1	89
sv	1	2013-12-05 12:21:21+01	1351	TextPlugin	\N	503	1	2	0	256
sv	\N	2012-01-16 18:21:22+01	962	LinkPlugin	961	298	2	3	1	70
sv	4	2010-11-23 10:08:00+01	265	TextPlugin	\N	108	1	26	0	20
sv	0	2013-11-04 16:23:12+01	1305	TextPlugin	\N	483	1	26	0	14
sv	3	2013-11-13 09:54:17+01	1346	CMSSurveyChartPlugin	\N	498	1	2	0	235
sv	1	2013-11-06 10:26:39+01	1315	LinkPlugin	355	131	2	3	1	66
sv	1	2011-12-15 12:55:37+01	882	TextPlugin	\N	254	1	4	0	255
sv	1	2011-12-19 11:27:33+01	885	SnippetPlugin	\N	255	1	2	0	69
sv	\N	2011-01-27 15:12:22+01	470	LinkPlugin	467	149	6	7	1	48
sv	1	2011-01-27 14:59:12+01	457	LinkPlugin	455	146	4	5	1	57
sv	\N	2010-12-09 14:17:13+01	316	LinkPlugin	314	126	4	5	1	77
sv	2	2011-01-27 14:51:40+01	452	LinkPlugin	451	145	2	3	1	60
sv	3	2011-01-27 14:54:53+01	453	PicturePlugin	451	145	4	5	1	60
sv	4	2011-01-27 14:55:49+01	454	LinkPlugin	451	145	6	7	1	60
sv	\N	2011-03-10 10:12:22+01	545	LinkPlugin	541	158	8	9	1	94
sv	\N	2011-03-10 10:12:09+01	544	LinkPlugin	541	158	6	7	1	94
sv	\N	2011-03-10 10:11:42+01	543	LinkPlugin	541	158	4	5	1	94
sv	0	2010-12-09 14:11:56+01	308	LinkPlugin	305	124	6	7	1	75
sv	0	2011-01-27 14:50:44+01	451	TextPlugin	\N	145	1	14	0	60
sv	1	2010-12-09 14:12:19+01	309	LinkPlugin	305	124	8	9	1	75
sv	2	2010-12-09 14:12:29+01	310	LinkPlugin	305	124	10	11	1	75
sv	3	2010-12-09 14:12:36+01	311	LinkPlugin	305	124	12	13	1	75
sv	1	2013-11-05 15:57:12+01	1313	TextPlugin	\N	485	1	2	0	253
sv	\N	2011-10-31 15:07:24+01	638	LinkPlugin	637	173	2	3	1	232
sv	1	2011-01-27 13:49:57+01	410	LinkPlugin	407	142	4	5	1	89
sv	3	2012-01-19 11:43:06+01	993	TextPlugin	\N	316	1	2	0	283
sv	\N	2011-10-31 15:53:28+01	649	LinkPlugin	472	150	6	7	1	37
sv	0	2010-12-09 14:15:48+01	314	TextPlugin	\N	126	1	6	0	77
sv	0	2011-12-13 16:39:18+01	872	TextPlugin	\N	249	1	2	0	256
sv	4	2012-01-20 11:38:45+01	1020	TextPlugin	\N	335	1	6	0	285
sv	2	2011-12-19 11:32:55+01	887	TextPlugin	\N	257	1	2	0	69
sv	1	2010-12-09 17:24:27+01	331	LinkPlugin	328	128	4	5	1	26
sv	0	2012-01-19 11:45:02+01	999	TextPlugin	\N	322	1	2	0	288
sv	5	2013-11-13 09:54:26+01	1347	CMSSurveyChartPlugin	\N	499	1	2	0	235
sv	2	2011-01-27 15:00:06+01	458	LinkPlugin	455	146	6	7	1	57
sv	\N	2012-11-19 18:23:18+01	1208	PicturePlugin	1207	439	2	3	1	317
sv	\N	2011-11-09 18:06:57+01	705	SnippetPlugin	455	146	18	19	1	57
sv	\N	2012-03-15 16:02:06+01	1103	PicturePlugin	1102	373	2	3	1	284
sv	1	2010-11-23 10:11:03+01	270	LinkPlugin	265	108	8	9	1	20
sv	7	2013-11-10 11:12:08+01	1343	LinkPlugin	1305	483	18	19	1	14
sv	\N	2011-11-11 11:33:54+01	739	LinkPlugin	737	206	4	5	1	251
sv	\N	2010-12-09 14:16:56+01	315	LinkPlugin	314	126	2	3	1	77
sv	0	2011-01-27 13:45:43+01	406	TextPlugin	\N	141	1	46	0	88
sv	2	2010-11-23 10:11:23+01	271	LinkPlugin	265	108	10	11	1	20
sv	\N	2011-03-10 10:08:15+01	542	LinkPlugin	541	158	2	3	1	94
sv	1	2010-11-23 10:14:16+01	274	LinkPlugin	272	109	2	3	1	19
sv	0	2011-01-27 15:09:46+01	467	TextPlugin	\N	149	1	12	0	48
sv	\N	2011-11-14 11:48:28+01	762	LinkPlugin	760	210	4	5	1	228
sv	\N	2011-01-27 15:03:26+01	461	LinkPlugin	459	147	4	5	1	54
sv	\N	2011-01-27 15:03:53+01	462	LinkPlugin	459	147	6	7	1	54
sv	\N	2011-01-27 15:07:12+01	465	PicturePlugin	463	148	4	5	1	51
sv	\N	2011-01-27 15:07:24+01	466	LinkPlugin	463	148	6	7	1	51
sv	\N	2011-01-27 15:11:45+01	469	PicturePlugin	467	149	4	5	1	48
sv	\N	2011-01-27 15:12:39+01	471	LinkPlugin	467	149	8	9	1	48
sv	2	2011-10-31 15:21:03+01	644	LinkPlugin	\N	176	1	2	0	230
sv	2	2011-01-27 13:50:11+01	411	LinkPlugin	407	142	4	5	1	89
sv	0	2011-01-27 13:48:28+01	407	TextPlugin	\N	142	1	16	0	89
sv	3	2012-11-06 16:59:56+01	1178	TextPlugin	\N	431	1	2	0	14
sv	6	2011-11-10 14:42:56+01	717	LinkPlugin	\N	197	1	2	0	238
sv	12	2011-01-27 13:54:43+01	418	LinkPlugin	406	141	4	5	1	88
sv	13	2011-01-27 13:51:32+01	416	LinkPlugin	406	141	2	3	1	88
sv	0	2011-12-13 12:27:32+01	858	TextPlugin	\N	241	1	2	0	238
sv	0	2011-11-08 11:51:31+01	679	TextPlugin	\N	188	1	8	0	245
sv	\N	2011-11-08 11:57:36+01	685	LinkPlugin	683	189	4	5	1	243
sv	0	2011-01-27 14:56:48+01	455	TextPlugin	\N	146	1	20	0	57
sv	3	2011-01-27 14:58:27+01	456	LinkPlugin	455	146	2	3	1	57
sv	0	2013-12-09 16:47:09+01	1353	TextPlugin	\N	505	1	2	0	311
sv	\N	2011-01-27 15:02:57+01	460	LinkPlugin	459	147	2	3	1	54
sv	0	2011-01-27 15:05:35+01	463	TextPlugin	\N	148	1	10	0	51
sv	0	2011-01-27 15:02:34+01	459	TextPlugin	\N	147	1	10	0	54
sv	\N	2011-01-27 15:05:56+01	464	LinkPlugin	463	148	2	3	1	51
sv	\N	2011-01-27 15:10:39+01	468	LinkPlugin	467	149	2	3	1	48
sv	1	2011-01-27 13:50:42+01	415	LinkPlugin	412	143	4	5	1	90
sv	5	2011-12-13 12:44:56+01	864	LinkPlugin	860	243	8	9	1	264
sv	2	2011-11-11 10:30:38+01	729	LinkPlugin	412	143	4	5	1	90
sv	0	2011-01-27 13:50:27+01	412	TextPlugin	\N	143	1	10	0	90
sv	\N	2012-01-16 18:22:29+01	964	LinkPlugin	963	299	2	3	1	70
sv	4	2011-12-20 13:17:25+01	889	PicturePlugin	\N	259	1	2	0	264
sv	3	2011-12-20 13:26:03+01	890	PicturePlugin	\N	260	1	2	0	264
sv	\N	2011-12-22 15:04:33+01	906	LinkPlugin	901	268	2	3	1	270
sv	0	2011-12-20 11:20:26+01	888	TextPlugin	\N	258	1	2	0	262
sv	0	2013-11-06 10:27:02+01	1316	TextPlugin	\N	487	1	6	0	347
sv	6	2012-02-23 17:47:44+01	1063	LinkPlugin	1020	335	2	3	1	285
sv	0	2012-11-12 11:00:34+01	1187	TextPlugin	\N	434	1	6	0	312
sv	2	2012-12-06 15:02:26+01	1254	TextPlugin	\N	455	1	2	0	286
sv	0	2014-02-27 10:57:43+01	1368	TextPlugin	\N	511	1	2	0	293
sv	0	2013-11-04 17:02:10+01	1311	LinkPlugin	333	129	58	59	1	24
sv	0	2010-11-23 10:13:53+01	272	TextPlugin	\N	109	1	10	0	19
sv	\N	2011-01-27 15:15:04+01	473	LinkPlugin	472	150	2	3	1	37
sv	0	2011-01-27 15:15:31+01	474	TextPlugin	\N	151	1	6	0	38
sv	\N	2011-01-27 15:15:34+01	475	SnippetPlugin	474	151	2	3	1	38
sv	\N	2011-01-27 15:15:43+01	476	LinkPlugin	474	151	4	5	1	38
sv	\N	2011-01-27 15:20:34+01	480	LinkPlugin	305	124	14	15	1	75
sv	0	2011-03-09 14:02:19+01	541	TextPlugin	\N	158	1	20	0	94
sv	5	2011-06-09 16:26:38+02	599	PicturePlugin	451	145	8	9	1	60
sv	9	2014-02-26 10:55:21+01	1359	PicturePlugin	\N	507	1	2	0	43
sv	0	2011-02-25 09:54:04+01	538	LinkPlugin	510	153	2	3	1	84
sv	0	2011-02-21 13:39:25+01	513	TextPlugin	\N	155	1	10	0	44
sv	3	2011-02-03 15:30:45+01	506	PicturePlugin	407	142	6	7	1	89
sv	1	2011-11-11 11:37:19+01	740	LinkPlugin	736	205	2	3	1	252
sv	1	2011-02-21 13:36:55+01	510	TextPlugin	\N	153	1	6	0	84
sv	5	2011-12-13 12:17:30+01	856	TextPlugin	\N	239	1	2	0	264
sv	2	2011-10-31 15:21:43+01	645	LinkPlugin	\N	177	1	2	0	230
sv	\N	2011-10-31 15:54:32+01	650	LinkPlugin	472	150	8	9	1	37
sv	0	2014-02-27 10:09:11+01	1363	TextPlugin	\N	509	1	26	0	294
sv	1	2011-12-20 13:26:57+01	891	PicturePlugin	\N	261	1	2	0	264
sv	0	2011-11-11 11:32:40+01	734	TextPlugin	\N	204	1	4	0	250
sv	\N	2011-10-31 15:08:36+01	639	LinkPlugin	637	173	4	5	1	232
sv	1	2011-12-22 15:05:43+01	907	TextPlugin	\N	272	1	8	0	268
sv	\N	2013-11-10 11:15:16+01	1344	PicturePlugin	1305	483	22	23	1	14
sv	\N	2013-11-06 10:27:08+01	1317	LinkPlugin	1316	487	2	3	1	347
sv	\N	2012-12-06 14:09:09+01	1247	LinkPlugin	511	154	6	7	1	43
sv	1	2012-11-12 11:01:06+01	1188	LinkPlugin	1187	434	2	3	1	312
sv	0	2011-12-02 17:42:52+01	850	TextPlugin	\N	235	1	6	0	253
sv	\N	2012-11-19 18:44:47+01	1213	PicturePlugin	1211	441	4	5	1	320
sv	\N	2011-11-08 11:54:23+01	680	LinkPlugin	679	188	2	3	1	245
sv	\N	2011-11-08 11:57:48+01	686	LinkPlugin	683	189	6	7	1	243
sv	4	2012-11-21 11:37:46+01	1223	FilePlugin	1222	444	2	3	1	323
sv	0	2011-01-27 15:14:56+01	472	TextPlugin	\N	150	1	12	0	37
sv	\N	2012-03-15 16:03:25+01	1104	PicturePlugin	1102	373	4	5	1	284
sv	4	2011-06-09 16:41:45+02	600	LinkPlugin	455	146	8	9	1	57
sv	\N	2011-11-09 18:07:48+01	706	SnippetPlugin	459	147	8	9	1	54
sv	2	2012-12-06 13:47:27+01	1243	TextPlugin	\N	447	1	2	0	42
sv	0	2011-12-13 16:42:00+01	873	TextPlugin	\N	250	1	2	0	257
sv	1	2012-03-15 16:07:26+01	1109	TextPlugin	\N	378	1	2	0	284
sv	3	2011-11-14 11:50:38+01	763	TextPlugin	\N	211	1	8	0	228
sv	2	2014-03-31 16:04:10+02	1385	PicturePlugin	1363	509	18	19	1	294
sv	0	2011-06-10 15:56:23+02	607	SnippetPlugin	\N	162	1	2	0	97
sv	0	2011-06-10 16:00:17+02	614	TextPlugin	\N	166	1	6	0	98
sv	\N	2011-06-10 16:00:25+02	615	LinkPlugin	614	166	2	3	1	98
sv	3	2011-06-10 15:58:30+02	610	TextPlugin	\N	165	1	8	0	99
sv	0	2011-06-10 15:58:35+02	611	LinkPlugin	610	165	2	3	1	99
sv	1	2011-06-10 15:58:47+02	612	LinkPlugin	610	165	4	5	1	99
sv	2	2011-06-10 15:59:37+02	613	LinkPlugin	610	165	6	7	1	99
sv	\N	2011-06-10 16:00:37+02	616	LinkPlugin	614	166	4	5	1	98
sv	0	2011-10-07 15:46:56+02	618	TextPlugin	\N	168	1	2	0	109
sv	1	2011-10-07 15:48:13+02	619	SnippetPlugin	\N	169	1	2	0	109
sv	1	2011-12-13 12:29:14+01	859	TextPlugin	\N	242	1	2	0	238
sv	6	2013-03-07 13:37:29+01	1292	LinkPlugin	520	156	34	35	1	42
sv	1	2013-11-06 11:54:58+01	1328	TextPlugin	\N	493	1	2	0	257
sv	4	2011-01-27 15:19:11+01	479	LinkPlugin	365	134	8	9	1	70
sv	2	2012-12-21 12:45:22+01	1263	SnippetPlugin	\N	460	1	2	0	328
sv	2	2011-11-11 10:31:06+01	730	LinkPlugin	328	128	8	9	1	26
sv	1	2013-11-13 09:54:32+01	1348	CMSSurveyChartPlugin	\N	500	1	2	0	235
sv	0	2011-01-27 13:28:21+01	394	LinkPlugin	389	137	4	5	1	31
sv	0	2012-02-28 10:31:23+01	1085	TextPlugin	\N	358	1	2	0	289
sv	0	2012-03-16 16:10:56+01	1116	TextPlugin	\N	385	1	2	0	295
sv	5	2012-01-12 19:17:32+01	943	SnippetPlugin	\N	289	1	2	0	69
sv	1	2011-01-27 13:29:02+01	395	LinkPlugin	389	137	6	7	1	31
sv	2	2011-10-31 17:11:08+01	660	LinkPlugin	657	181	2	3	1	238
sv	0	2012-01-19 11:43:22+01	994	TextPlugin	\N	317	1	2	0	285
sv	2	2011-05-30 15:13:53+02	592	LinkPlugin	324	127	6	7	1	25
sv	2	2013-11-04 16:07:34+01	1301	PicturePlugin	\N	480	1	2	0	12
sv	\N	2012-01-16 18:23:10+01	965	LinkPlugin	963	299	4	5	1	70
sv	5	2011-01-27 13:25:41+01	389	TextPlugin	\N	137	1	16	0	31
sv	2	2012-02-28 10:32:58+01	1090	TextPlugin	\N	363	1	2	0	291
sv	1	2013-01-31 10:44:05+01	1278	TextPlugin	\N	474	1	2	0	42
sv	2	2012-02-28 10:49:24+01	1093	PicturePlugin	\N	366	1	2	0	289
sv	3	2012-04-05 13:01:16+02	1143	TextPlugin	\N	410	1	2	0	297
sv	7	2012-03-16 16:14:46+01	1121	TextPlugin	\N	390	1	2	0	297
sv	5	2012-02-23 17:48:15+01	1064	LinkPlugin	1020	335	4	5	1	285
sv	1	2012-02-28 11:35:50+01	1096	PicturePlugin	\N	368	1	2	0	289
sv	0	2011-02-21 13:39:01+01	511	TextPlugin	\N	154	1	10	0	43
sv	9	2012-03-16 16:15:52+01	1123	TextPlugin	\N	392	1	2	0	297
sv	0	2012-04-05 13:36:22+02	1149	TextPlugin	\N	416	1	4	0	254
sv	\N	2011-11-09 18:08:21+01	707	SnippetPlugin	463	148	8	9	1	51
sv	1	2012-11-21 11:38:57+01	1224	FilePlugin	1222	444	4	5	1	323
sv	1	2013-11-04 16:15:32+01	1302	TextPlugin	\N	481	1	2	0	12
sv	4	2012-12-06 14:16:45+01	1248	TextPlugin	\N	450	1	4	0	42
sv	5	2011-10-31 17:17:05+01	661	LinkPlugin	657	181	4	5	1	238
sv	0	2011-10-31 17:39:08+01	671	LinkPlugin	\N	186	1	2	0	237
sv	2	2012-11-21 16:49:47+01	1230	FilePlugin	1222	444	6	7	1	323
sv	10	2014-02-26 10:55:47+01	1360	PicturePlugin	\N	508	1	2	0	43
sv	2	2011-11-21 17:54:23+01	799	LinkPlugin	793	217	2	3	1	256
sv	0	2011-11-21 13:07:09+01	780	TextPlugin	\N	213	1	2	0	253
sv	2	2011-11-14 11:43:07+01	758	SnippetPlugin	672	187	2	3	1	237
sv	\N	2013-11-06 10:27:24+01	1318	LinkPlugin	1316	487	4	5	1	347
sv	\N	2011-11-08 11:54:39+01	681	LinkPlugin	679	188	4	5	1	245
sv	0	2011-11-08 11:58:20+01	687	TextPlugin	\N	190	1	4	0	244
sv	\N	2011-11-11 11:32:44+01	735	LinkPlugin	734	204	2	3	1	250
sv	\N	2011-11-09 18:00:54+01	701	SnippetPlugin	472	150	10	11	1	37
sv	\N	2011-11-14 11:50:42+01	764	LinkPlugin	763	211	2	3	1	228
sv	1	2014-03-31 16:03:17+02	1384	PicturePlugin	1363	509	16	17	1	294
sv	3	2012-01-12 18:26:53+01	931	TextPlugin	\N	278	1	4	0	69
sv	0	2011-12-22 14:41:42+01	902	TextPlugin	\N	269	1	2	0	271
sv	3	2012-11-12 11:05:37+01	1193	LinkPlugin	324	127	16	17	1	25
sv	2	2012-03-16 16:10:32+01	1115	TextPlugin	\N	384	1	2	0	295
sv	4	2012-01-12 18:49:38+01	935	TextPlugin	\N	282	1	2	0	69
sv	\N	2012-11-12 11:24:27+01	1195	LinkPlugin	265	108	22	23	1	20
sv	4	2013-01-31 10:37:24+01	1275	TextPlugin	\N	472	1	4	0	43
sv	\N	2013-11-10 11:21:04+01	1345	LinkPlugin	1305	483	24	25	1	14
sv	2	2011-12-13 12:39:25+01	860	TextPlugin	\N	243	1	12	0	264
sv	\N	2012-02-28 10:55:24+01	1094	LinkPlugin	1086	359	2	3	1	289
sv	0	2011-12-20 17:03:56+01	892	PicturePlugin	\N	262	1	2	0	264
sv	\N	2011-10-31 15:09:08+01	640	LinkPlugin	637	173	6	7	1	232
sv	1	2013-11-06 10:47:20+01	1321	TextPlugin	\N	489	1	6	0	30
sv	3	2012-02-28 10:31:58+01	1086	TextPlugin	\N	359	1	4	0	289
sv	2	2010-12-09 17:28:45+01	333	TextPlugin	\N	129	1	64	0	24
sv	0	2011-12-22 11:51:10+01	895	TextPlugin	\N	264	1	2	0	268
sv	1	2011-12-22 11:55:47+01	901	TextPlugin	\N	268	1	4	0	270
sv	2	2013-11-13 10:09:55+01	1349	TextPlugin	\N	501	1	2	0	235
sv	0	2012-03-16 16:08:03+01	1110	TextPlugin	\N	379	1	2	0	297
sv	1	2012-11-12 10:44:53+01	1183	TextPlugin	\N	432	1	2	0	36
sv	0	2011-10-31 16:04:55+01	651	TextPlugin	\N	178	1	4	0	235
sv	\N	2012-11-19 18:28:34+01	1209	PicturePlugin	1207	439	4	5	1	317
sv	0	2012-06-05 16:58:39+02	1161	TextPlugin	\N	423	1	6	0	300
sv	2	2012-01-19 13:15:00+01	1007	TextPlugin	\N	330	1	4	0	36
sv	2	2011-12-22 15:05:50+01	908	LinkPlugin	907	272	2	3	1	268
sv	2	2012-01-19 11:45:35+01	1001	TextPlugin	\N	324	1	2	0	288
sv	0	2012-12-21 12:44:36+01	1260	TextPlugin	\N	457	1	2	0	327
sv	\N	2012-11-19 18:45:18+01	1214	LinkPlugin	1204	437	2	3	1	315
sv	3	2012-12-21 12:45:34+01	1264	SnippetPlugin	\N	461	1	2	0	328
sv	0	2012-11-19 18:21:32+01	1204	TextPlugin	\N	437	1	4	0	315
sv	0	2012-11-12 11:01:35+01	1189	TextPlugin	\N	435	1	2	0	313
sv	2	2013-11-07 17:25:13+01	1335	LinkPlugin	1332	496	2	3	1	13
sv	0	2012-01-17 14:56:37+01	976	TextPlugin	\N	303	1	2	0	71
sv	0	2012-01-12 18:25:23+01	926	TextPlugin	\N	276	1	8	0	69
sv	0	2012-11-21 11:34:51+01	1219	TextPlugin	\N	443	1	8	0	321
sv	3	2013-11-06 11:52:20+01	1325	TextPlugin	\N	490	1	2	0	26
sv	4	2013-11-06 11:55:32+01	1329	TextPlugin	\N	494	1	2	0	30
sv	0	2012-11-06 10:29:26+01	1168	TextPlugin	\N	427	1	6	0	236
sv	2	2012-04-19 14:12:15+02	1150	TextPlugin	\N	417	1	2	0	297
sv	0	2013-03-07 13:27:25+01	1289	TextPlugin	\N	477	1	2	0	292
sv	0	2012-06-07 11:21:03+02	1164	TextPlugin	\N	424	1	2	0	303
sv	5	2012-03-23 11:01:26+01	1135	TextPlugin	\N	403	1	2	0	297
sv	6	2012-03-16 16:13:40+01	1120	TextPlugin	\N	389	1	2	0	297
sv	2	2011-12-02 17:42:55+01	851	LinkPlugin	850	235	2	3	1	253
sv	3	2012-12-06 14:58:14+01	1251	PicturePlugin	\N	452	1	2	0	43
sv	1	2012-02-28 11:36:22+01	1097	SnippetPlugin	\N	369	1	2	0	291
sv	8	2012-03-16 16:15:31+01	1122	TextPlugin	\N	391	1	2	0	297
sv	3	2012-02-28 10:33:31+01	1091	TextPlugin	\N	364	1	2	0	291
sv	1	2012-06-07 11:25:09+02	1165	PicturePlugin	\N	425	1	2	0	303
sv	13	2012-03-16 16:30:08+01	1130	TextPlugin	\N	399	1	2	0	297
sv	0	2011-02-23 14:02:05+01	520	TextPlugin	\N	156	1	36	0	42
sv	0	2012-12-21 12:44:57+01	1261	TextPlugin	\N	458	1	2	0	328
sv	\N	2011-11-09 18:08:52+01	708	SnippetPlugin	467	149	10	11	1	48
sv	1	2011-12-13 12:55:51+01	867	TextPlugin	\N	244	1	28	0	14
sv	0	2011-12-22 14:41:50+01	903	PicturePlugin	\N	270	1	2	0	272
sv	0	2011-10-31 15:09:28+01	641	SnippetPlugin	\N	174	1	2	0	231
sv	0	2013-11-06 10:27:49+01	1319	TextPlugin	\N	488	1	4	0	227
sv	0	2011-11-11 11:32:54+01	736	TextPlugin	\N	205	1	6	0	252
sv	2	2013-11-04 16:17:05+01	1303	TextPlugin	\N	482	1	2	0	14
sv	7	2011-11-11 12:00:13+01	742	LinkPlugin	657	181	10	11	1	238
sv	\N	2011-10-26 17:36:42+02	627	SnippetPlugin	510	153	4	5	1	84
sv	11	2012-03-16 16:21:26+01	1124	TextPlugin	\N	393	1	2	0	297
sv	3	2011-10-31 17:39:12+01	672	TextPlugin	\N	187	1	8	0	237
sv	\N	2011-11-08 11:56:44+01	682	LinkPlugin	679	188	6	7	1	245
sv	\N	2011-11-08 11:58:24+01	688	LinkPlugin	687	190	2	3	1	244
sv	3	2011-12-13 12:41:21+01	861	PicturePlugin	860	243	2	3	1	264
sv	1	2012-03-16 16:11:17+01	1117	PicturePlugin	\N	386	1	2	0	295
sv	0	2012-11-19 18:21:42+01	1205	TextPlugin	\N	438	1	2	0	317
sv	0	2012-11-19 18:41:51+01	1210	LinkPlugin	\N	440	1	2	0	320
sv	2	2012-01-19 13:16:18+01	1008	SnippetPlugin	1007	330	2	3	1	36
sv	0	2012-02-28 10:34:01+01	1092	TextPlugin	\N	365	1	2	0	290
sv	\N	2011-11-14 11:50:51+01	765	LinkPlugin	763	211	4	5	1	228
sv	0	2013-11-06 12:00:45+01	1330	TextPlugin	\N	495	1	2	0	76
sv	1	2011-12-22 15:06:05+01	909	TextPlugin	\N	273	1	4	0	269
sv	8	2013-11-10 11:10:50+01	1340	LinkPlugin	1305	483	12	13	1	14
sv	4	2012-02-28 10:32:10+01	1087	SnippetPlugin	\N	360	1	2	0	289
sv	\N	2013-11-06 10:49:50+01	1322	LinkPlugin	1321	489	2	3	1	30
sv	6	2011-11-09 18:01:39+01	702	SnippetPlugin	405	140	12	13	1	81
sv	0	2011-12-22 11:51:16+01	896	TextPlugin	\N	265	1	2	0	270
sv	4	2013-11-07 17:04:53+01	1332	TextPlugin	\N	496	1	4	0	14
sv	2	2013-11-06 11:52:43+01	1326	TextPlugin	\N	491	1	2	0	254
sv	4	2013-11-13 10:10:39+01	1350	TextPlugin	\N	502	1	2	0	235
sv	\N	2012-11-21 11:35:17+01	1220	LinkPlugin	1219	443	2	3	1	321
sv	2	2012-06-07 11:25:58+02	1166	TextPlugin	\N	426	1	2	0	303
sv	0	2012-11-21 11:39:28+01	1225	SnippetPlugin	\N	445	1	2	0	322
sv	0	2012-11-19 18:47:43+01	1215	TextPlugin	\N	442	1	2	0	318
sv	2	2011-11-21 16:14:27+01	793	TextPlugin	\N	217	1	10	0	256
sv	1	2012-04-19 14:12:17+02	1151	TextPlugin	\N	418	1	2	0	297
sv	3	2012-12-06 15:00:30+01	1252	PicturePlugin	\N	453	1	2	0	286
sv	0	2010-10-14 15:49:25+02	48	TextPlugin	\N	26	1	46	0	18
sv	\N	2012-11-21 16:53:29+01	1231	LinkPlugin	1219	443	6	7	1	321
sv	2	2013-11-04 16:55:43+01	1308	FilePlugin	333	129	54	55	1	24
sv	7	2012-12-06 14:17:09+01	1249	LinkPlugin	1248	450	2	3	1	42
sv	2	2012-01-19 11:43:52+01	996	TextPlugin	\N	319	1	2	0	285
sv	\N	2013-01-31 10:37:46+01	1276	PicturePlugin	1275	472	2	3	1	43
sv	1	2012-12-06 14:07:21+01	1245	TextPlugin	\N	449	1	2	0	288
sv	0	2012-01-19 11:45:53+01	1002	TextPlugin	\N	325	1	2	0	286
sv	0	2012-01-19 11:44:26+01	997	TextPlugin	\N	320	1	2	0	284
sv	1	2011-12-22 14:42:09+01	904	PicturePlugin	\N	271	1	2	0	272
sv	3	2012-11-21 16:55:53+01	1232	LinkPlugin	1222	444	8	9	1	323
sv	\N	2011-10-31 15:20:11+01	642	LinkPlugin	637	173	8	9	1	232
sv	3	2013-11-06 11:53:19+01	1327	TextPlugin	\N	492	1	2	0	254
sv	\N	2011-11-09 18:13:42+01	709	SnippetPlugin	407	142	12	13	1	89
sv	3	2013-11-04 16:56:05+01	1309	FilePlugin	333	129	56	57	1	24
sv	0	2011-11-14 11:46:52+01	760	TextPlugin	\N	210	1	6	0	228
sv	\N	2011-11-14 11:51:15+01	766	LinkPlugin	763	211	6	7	1	228
sv	\N	2011-12-22 15:06:11+01	910	LinkPlugin	909	273	2	3	1	269
sv	0	2011-11-11 11:33:37+01	737	TextPlugin	\N	206	1	6	0	251
sv	3	2013-01-31 10:35:20+01	1273	TextPlugin	\N	470	1	2	0	42
sv	1	2012-02-21 10:08:13+01	1045	SnippetPlugin	\N	348	1	2	0	43
sv	1	2012-03-15 16:06:04+01	1107	TextPlugin	\N	376	1	2	0	44
sv	\N	2013-11-06 10:28:12+01	1320	PicturePlugin	1319	488	2	3	1	227
sv	0	2011-11-08 11:57:16+01	683	TextPlugin	\N	189	1	8	0	243
sv	\N	2013-03-07 13:32:49+01	1291	LinkPlugin	511	154	8	9	1	43
sv	4	2011-12-13 12:42:42+01	862	LinkPlugin	860	243	4	5	1	264
sv	0	2012-02-28 10:32:19+01	1088	TextPlugin	\N	361	1	2	0	291
sv	0	2012-03-16 16:12:04+01	1118	TextPlugin	\N	387	1	2	0	296
sv	5	2013-01-31 10:43:51+01	1277	TextPlugin	\N	473	1	2	0	42
sv	\N	2013-11-06 10:50:18+01	1323	LinkPlugin	1321	489	4	5	1	30
sv	\N	2012-12-06 14:08:33+01	1246	LinkPlugin	511	154	4	5	1	43
sv	0	2011-12-22 11:51:19+01	897	TextPlugin	\N	266	1	2	0	269
sv	0	2011-12-13 12:58:29+01	868	TextPlugin	\N	245	1	4	0	255
sv	1	2011-01-27 10:30:34+01	368	LinkPlugin	365	134	4	5	1	70
sv	2	2011-01-27 10:31:14+01	370	LinkPlugin	365	134	8	9	1	70
sv	3	2012-01-12 19:29:11+01	944	PicturePlugin	\N	290	1	2	0	70
sv	0	2011-01-27 10:08:54+01	365	TextPlugin	\N	134	1	14	0	70
sv	6	2012-02-17 16:09:45+01	1044	TextPlugin	\N	347	1	4	0	89
sv	0	2012-01-19 11:42:35+01	991	TextPlugin	\N	314	1	2	0	283
sv	5	2013-11-10 11:11:11+01	1341	LinkPlugin	1305	483	14	15	1	14
sv	1	2013-11-07 17:21:20+01	1333	TextPlugin	\N	497	1	4	0	13
sv	2	2011-10-31 17:04:44+01	657	TextPlugin	\N	181	1	20	0	238
sv	5	2012-01-16 18:21:14+01	961	TextPlugin	\N	298	1	4	0	70
sv	1	2012-11-19 18:41:56+01	1211	TextPlugin	\N	441	1	6	0	320
sv	\N	2012-11-21 11:35:33+01	1221	LinkPlugin	1219	443	4	5	1	321
sv	0	2012-11-12 10:57:03+01	1185	TextPlugin	\N	433	1	2	0	314
sv	0	2011-02-24 13:22:14+01	527	TextPlugin	\N	157	1	90	0	13
sv	1	2011-01-27 14:09:42+01	425	LinkPlugin	405	140	10	11	1	81
sv	\N	2012-11-12 11:02:59+01	1191	LinkPlugin	265	108	20	21	1	20
sv	2	2012-12-06 15:01:03+01	1253	TextPlugin	\N	454	1	2	0	43
sv	2	2011-01-27 14:09:07+01	424	LinkPlugin	405	140	8	9	1	81
sv	3	2011-01-27 14:07:54+01	422	LinkPlugin	405	140	6	7	1	81
sv	4	2011-01-27 14:04:08+01	421	PicturePlugin	405	140	4	5	1	81
sv	5	2011-01-27 14:03:42+01	420	LinkPlugin	405	140	2	3	1	81
sv	0	2011-01-27 13:45:04+01	405	TextPlugin	\N	140	1	26	0	81
sv	1	2012-11-06 16:52:37+01	1176	TextPlugin	\N	430	1	4	0	311
sv	1	2012-12-21 12:45:10+01	1262	SnippetPlugin	\N	459	1	2	0	328
sv	0	2011-11-21 16:14:30+01	794	TextPlugin	\N	218	1	18	0	258
sv	4	2012-04-05 13:01:14+02	1142	TextPlugin	\N	409	1	2	0	297
sv	12	2012-03-16 16:21:49+01	1125	TextPlugin	\N	394	1	2	0	297
sv	0	2010-12-09 17:22:24+01	324	TextPlugin	\N	127	1	28	0	25
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 1385, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_globalpagepermission (can_publish, group_id, can_moderate, can_change, can_change_permissions, can_recover_page, can_add, user_id, can_delete, can_move_page, id, can_change_advanced_settings) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_page (rght, level, navigation_extenders, parent_id, reverse_id, login_required, soft_root, creation_date, lft, publication_end_date, template, tree_id, publication_date, in_navigation, id, moderator_state, published, site_id, changed_by, created_by, publisher_is_draft, publisher_state, publisher_public_id, limit_visibility_in_menu) FROM stdin;
44	0		\N	\N	f	f	2013-11-04 16:38:21+01	1	\N	base/threecol.html	1	2013-11-04 16:38:31+01	f	92	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
3	1		92	\N	f	f	2012-11-12 10:55:09+01	2	\N	base/threecol.html	1	2012-11-12 10:55:28+01	f	82	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
5	1		92	\N	f	f	2012-11-19 18:32:53+01	4	\N	base/threecol.html	1	2012-11-19 18:33:04+01	f	84	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
7	1		92	\N	f	f	2012-12-21 12:44:03+01	6	\N	base/threecol.html	1	2012-12-21 12:44:16+01	f	87	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
9	1		92	\N	f	f	2012-11-19 18:21:01+01	8	\N	base/threecol.html	1	2012-11-19 18:21:45+01	f	83	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
11	1		92	\N	f	f	2010-10-14 10:16:11+02	10	\N	base/threecol.html	1	\N	f	9	0	f	1	asdahlborg	moa	t	1	\N	\N
13	1		92	\N	f	f	2012-11-21 11:33:09+01	12	\N	base/threecol.html	1	2012-11-21 11:33:40+01	f	85	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
15	1		92	\N	f	f	2011-03-10 10:23:32+01	14	\N	base/twocol.html	1	\N	f	52	0	f	1	asdahlborg	moa	t	1	\N	\N
17	1		92	\N	f	f	2011-10-31 17:03:19+01	16	\N	base/threecol.html	1	2011-10-31 17:23:09+01	f	58	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
41	1		92	\N	f	f	2011-01-27 13:44:23+01	18	\N	base/threecol.html	1	2011-10-31 15:00:10+01	f	41	0	f	1	asdahlborg	moa	t	1	\N	\N
20	2		41	\N	f	f	2011-01-27 13:43:49+01	19	\N	base/twocol.html	1	\N	f	40	0	f	1	asdahlborg	moa	t	1	\N	\N
22	2		41	\N	f	f	2011-01-27 13:56:55+01	21	\N	base/twocol.html	1	\N	f	42	0	f	1	asdahlborg	moa	t	1	\N	\N
24	2		41	\N	f	f	2011-01-27 13:57:32+01	23	\N	base/twocol.html	1	\N	f	43	0	f	1	asdahlborg	moa	t	1	\N	\N
26	2		41	\N	f	f	2011-01-27 13:57:40+01	25	\N	base/twocol.html	1	\N	f	44	0	f	1	asdahlborg	moa	t	1	\N	\N
28	2		41	\N	f	f	2011-01-27 13:58:02+01	27	\N	base/twocol.html	1	\N	f	45	0	f	1	asdahlborg	moa	t	1	\N	\N
30	2		41	\N	f	f	2011-01-27 13:59:18+01	29	\N	base/twocol.html	1	\N	f	46	0	f	1	asdahlborg	moa	t	1	\N	\N
32	2		41	\N	f	f	2011-01-27 13:59:49+01	31	\N	base/twocol.html	1	\N	f	47	0	f	1	asdahlborg	moa	t	1	\N	\N
34	2		41	\N	f	f	2011-01-27 13:35:33+01	33	\N	base/threecol.html	1	\N	f	39	0	f	1	asdahlborg	moa	t	1	\N	\N
36	2		41	\N	f	f	2011-10-07 15:46:24+02	35	\N	base/twocol.html	1	\N	f	55	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
38	2		41	\N	f	f	2011-12-22 11:50:35+01	37	\N	base/threecol.html	1	2011-12-22 11:51:30+01	f	67	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
40	2		41	\N	f	f	2011-12-22 14:41:21+01	39	\N	base/twocol.html	1	2011-12-22 14:42:16+01	f	68	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
43	1		92	\N	f	f	2010-10-15 15:36:59+02	42	\N	base/threecol.html	1	\N	f	12	0	f	1	asdahlborg	moa	t	1	\N	\N
2	0		\N	\N	f	f	2010-01-17 11:38:37+01	1	\N	base/threecol.html	2	2011-10-18 10:28:07+02	t	7	0	t	1	mohammad	admin	t	1	\N	\N
6	0	\N	\N	\N	f	f	2010-01-17 11:35:36+01	1	\N	base/twocol.html	6	2013-11-06 10:53:48+01	f	4	0	t	1	asdahlborg	admin	t	1	\N	\N
2	0		\N	\N	f	f	2010-12-09 17:16:42+01	1	\N	base/threecol.html	6	2011-10-31 15:01:55+01	t	30	0	t	1	asdahlborg	moa	t	1	\N	\N
3	1	\N	4	\N	f	f	2010-01-17 11:36:01+01	2	\N	base/twocol.html	6	\N	f	6	0	t	1	admin	admin	t	1	\N	\N
5	1	\N	4	\N	f	f	2010-01-17 11:35:50+01	4	\N	base/twocol.html	6	\N	f	5	0	t	1	admin	admin	t	1	\N	\N
2	0		\N	\N	f	f	2012-02-28 17:14:44+01	1	\N	base/threecol.html	7	2012-02-28 17:15:22+01	t	75	0	t	1	testä	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2010-10-14 15:10:48+02	1	\N	base/threecol.html	8	2013-11-04 17:08:51+01	t	11	0	t	1	asdahlborg	moa	t	1	\N	\N
2	0		\N	\N	f	f	2010-10-22 13:57:58+02	1	\N	base/threecol.html	19	2013-11-04 17:11:50+01	f	24	0	t	1	asdahlborg	moa	t	1	\N	\N
2	0		\N	\N	f	f	2011-11-21 13:07:01+01	1	\N	base/threecol.html	20	2011-11-21 13:17:30+01	t	62	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2012-11-06 16:51:26+01	1	\N	base/twocol.html	21	2012-11-06 16:52:49+01	f	81	0	t	1	testä	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2011-11-21 16:14:23+01	1	\N	base/threecol.html	22	2011-11-21 17:57:29+01	t	63	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
4	0		\N	contact	f	f	2010-12-09 14:10:56+01	1	\N	base/threecol.html	23	2011-11-10 16:41:10+01	t	29	0	t	1	edward	moa	t	1	\N	\N
3	1		29	\N	f	f	2011-11-11 11:32:27+01	2	\N	base/threecol.html	23	2011-11-11 11:34:22+01	f	61	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2010-11-23 12:24:41+01	1	\N	base/threecol.html	29	2011-12-19 11:28:28+01	f	25	0	f	1	testä	influensamupp	t	1	\N	\N
10	0		\N	\N	f	f	2011-02-08 09:59:45+01	1	\N	base/threecol.html	30	2011-10-31 14:27:31+01	f	49	0	f	1	asdahlborg	influensamupp	t	1	\N	\N
3	1		49	\N	f	f	2012-01-19 11:41:17+01	2	\N	INHERIT	30	2012-01-19 11:41:57+01	f	73	0	f	1	asdahlborg	epiworkadmin	t	1	\N	\N
5	1		49	\N	f	f	2012-01-19 11:41:02+01	4	\N	INHERIT	30	2012-01-19 11:41:52+01	f	72	0	f	1	asdahlborg	epiworkadmin	t	1	\N	\N
7	1		49	\N	f	f	2012-02-28 10:31:09+01	6	\N	INHERIT	30	2012-02-28 10:34:11+01	f	74	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
9	1		49	\N	f	f	2012-03-16 16:07:34+01	8	\N	INHERIT	30	2012-03-16 16:08:32+01	f	76	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	t	f	2011-03-09 14:01:42+01	1	\N	base/twocol.html	33	\N	f	50	0	t	1	moa	influensamupp	t	1	\N	\N
2	0		\N	\N	f	f	2011-03-15 12:52:10+01	1	\N	base/twocol.html	35	\N	f	53	0	t	1	moa	moa	t	1	\N	\N
4	0	\N	\N	\N	f	f	2010-01-17 10:45:58+01	1	\N	base/twocol.html	36	2013-11-04 17:11:39+01	f	3	0	t	1	asdahlborg	admin	t	1	\N	\N
3	1		3	\N	f	f	2011-11-08 11:50:56+01	2	\N	base/threecol.html	36	2011-11-08 11:51:24+01	f	60	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2011-06-10 15:55:43+02	1	\N	base/threecol.html	37	\N	f	54	0	f	1	mohammad	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2011-10-31 15:04:36+01	1	\N	base/threecol.html	38	2011-10-31 15:13:35+01	f	56	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2011-10-31 16:04:48+01	1	\N	base/twocol.html	39	2011-10-31 16:06:52+01	f	57	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2011-12-13 12:00:13+01	1	\N	base/threecol.html	41	2011-12-13 12:50:12+01	f	65	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2012-06-05 16:58:30+02	1	\N	base/threecol.html	42	2012-06-05 16:59:19+02	f	77	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2012-06-07 11:20:52+02	1	\N	base/threecol.html	43	2012-06-07 11:23:29+02	f	78	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
4	0		\N	\N	f	f	2012-06-07 11:29:04+02	1	\N	base/threecol.html	44	2012-06-07 11:29:12+02	f	79	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
3	1		79	\N	f	f	2012-06-07 11:29:22+02	2	\N	INHERIT	44	2012-06-07 11:29:29+02	f	80	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
2	0		\N	\N	f	f	2013-01-28 17:33:51+01	1	\N	base/threecol.html	45	2013-01-28 17:34:29+01	f	88	0	f	1	asdahlborg	asdahlborg	t	1	\N	\N
4	0		\N	\N	f	f	2013-11-04 16:21:57+01	1	\N	base/threecol.html	46	2013-11-04 16:22:07+01	f	90	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
3	1		90	\N	f	f	2013-11-04 16:22:22+01	2	\N	base/threecol.html	46	2013-11-04 16:22:36+01	f	91	0	t	1	asdahlborg	asdahlborg	t	1	\N	\N
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_page_id_seq', 92, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	92	344
2	92	345
3	92	343
4	82	313
5	82	312
6	82	314
7	84	319
8	84	318
9	84	320
10	87	328
11	87	329
12	87	327
13	83	317
14	83	316
15	83	315
16	9	19
17	9	18
18	9	20
19	85	322
20	85	323
21	85	321
22	52	106
23	52	228
24	58	236
25	58	237
26	58	238
27	41	90
28	41	88
29	41	89
30	40	81
31	40	246
32	42	63
33	42	239
34	43	60
35	43	221
36	44	57
37	44	247
38	45	54
39	45	248
40	46	51
41	46	249
42	47	222
43	47	48
44	39	226
45	39	225
46	39	84
47	55	346
48	55	109
49	67	270
50	67	269
51	67	268
52	68	271
53	68	272
54	12	38
55	12	37
56	12	36
57	7	13
58	7	12
59	7	14
60	4	3
61	4	223
62	30	24
63	30	25
64	30	26
65	6	9
66	6	348
67	5	349
68	5	6
69	75	294
70	75	292
71	75	293
72	11	32
73	11	31
74	11	30
75	24	227
76	24	347
77	24	66
78	62	253
79	62	254
80	62	255
81	81	311
82	81	310
83	63	258
84	63	256
85	63	257
86	29	77
87	29	76
88	29	75
89	61	252
90	61	250
91	61	251
92	25	69
93	25	71
94	25	70
95	49	44
96	49	42
97	49	43
98	73	288
99	73	287
100	73	286
101	72	283
102	72	285
103	72	284
104	74	289
105	74	290
106	74	291
107	76	296
108	76	297
109	76	295
110	50	94
111	50	229
112	53	103
113	53	330
114	3	224
115	3	273
116	3	220
117	60	245
118	60	244
119	60	243
120	54	99
121	54	98
122	54	97
123	56	230
124	56	231
125	56	232
126	57	234
127	57	235
128	57	233
129	65	263
130	65	262
131	65	264
132	77	300
133	77	298
134	77	299
135	78	301
136	78	302
137	78	303
138	79	304
139	79	305
140	79	306
141	80	308
142	80	309
143	80	307
144	88	331
145	88	333
146	88	332
147	90	337
148	90	339
149	90	338
150	91	340
151	91	341
152	91	342
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 152, true);


--
-- Data for Name: cms_pagemoderator; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_pagemoderator (moderate_page, moderate_children, page_id, user_id, id, moderate_descendants) FROM stdin;
\.


--
-- Name: cms_pagemoderator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_pagemoderator_id_seq', 1, false);


--
-- Data for Name: cms_pagemoderatorstate; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_pagemoderatorstate (created, page_id, user_id, action, message, id) FROM stdin;
\.


--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_pagemoderatorstate_id_seq', 1, false);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_pagepermission (group_id, can_publish, page_id, user_id, id, can_delete, can_change_permissions, can_moderate, can_add, grant_on, can_move_page, can_change, can_change_advanced_settings) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cms_placeholder (slot, id, default_width) FROM stdin;
Main content	3	\N
Main content	6	\N
Main content	9	\N
Right bar	12	\N
Main content	13	\N
Left bar	14	\N
Main content	18	\N
Right bar	19	\N
Left bar	20	\N
Main content	24	\N
Left bar	25	\N
Right bar	26	\N
Right bar	30	\N
Left bar	31	\N
Main content	32	\N
Main content	36	\N
Left bar	37	\N
Right bar	38	\N
Main content	42	\N
Left bar	43	\N
Right bar	44	\N
Main content	48	\N
Main content	51	\N
Main content	54	\N
Main content	57	\N
Main content	60	\N
Main content	63	\N
Main content	66	\N
Main content	69	\N
Left bar	70	\N
Right bar	71	\N
Left bar	75	\N
Right bar	76	\N
Main content	77	\N
Main content	81	\N
Main content	84	\N
Main content	88	\N
Left bar	89	\N
Right bar	90	\N
Main content	94	\N
Main content	97	\N
Right bar	98	\N
Left bar	99	\N
Main content	103	\N
Main content	106	\N
Main content	109	\N
Left bar	150	\N
Right bar	151	\N
Main content	152	\N
Left bar	153	\N
Right bar	154	\N
Main content	155	\N
Left bar	156	\N
Right bar	157	\N
Main content	158	\N
Left bar	159	\N
Right bar	160	\N
Main content	161	\N
Right bar	162	\N
Main content	163	\N
Right bar	164	\N
Main content	165	\N
Right bar	166	\N
Main content	167	\N
Right bar	168	\N
Main content	169	\N
Right bar	170	\N
Main content	171	\N
Right bar	172	\N
Main content	173	\N
Right bar	174	\N
Main content	175	\N
Left bar	176	\N
Right bar	177	\N
Main content	178	\N
Right bar	179	\N
Main content	180	\N
Right bar	181	\N
Main content	182	\N
Left bar	183	\N
Right bar	184	\N
Main content	185	\N
Right bar	186	\N
Main content	187	\N
Right bar	188	\N
Main content	189	\N
Right bar	190	\N
Main content	191	\N
Left bar	192	\N
Right bar	193	\N
Main content	194	\N
Left bar	195	\N
Right bar	196	\N
Main content	197	\N
Right bar	198	\N
Main content	199	\N
Left bar	200	\N
Right bar	201	\N
Main content	202	\N
Left bar	203	\N
Right bar	204	\N
Main content	205	\N
Right bar	206	\N
Main content	207	\N
Right bar	208	\N
Main content	209	\N
Right bar	210	\N
Main content	211	\N
Left bar	212	\N
Right bar	213	\N
Main content	214	\N
Right bar	220	\N
Right bar	221	\N
Right bar	222	\N
Right bar	223	\N
Main content	224	\N
Left bar	225	\N
Right bar	226	\N
Right bar	227	\N
Right bar	228	\N
Right bar	229	\N
Left bar	230	\N
Right bar	231	\N
Main content	232	\N
Left bar	233	\N
Right bar	234	\N
Main content	235	\N
Left bar	236	\N
Right bar	237	\N
Main content	238	\N
Right bar	239	\N
Left bar	243	\N
Right bar	244	\N
Main content	245	\N
Right bar	246	\N
Right bar	247	\N
Right bar	248	\N
Right bar	249	\N
Left bar	250	\N
Right bar	251	\N
Main content	252	\N
Left bar	253	\N
Right bar	254	\N
Main content	255	\N
Left bar	256	\N
Right bar	257	\N
Main content	258	\N
Left bar	262	\N
Right bar	263	\N
Main content	264	\N
Left bar	268	\N
Right bar	269	\N
Main content	270	\N
Right bar	271	\N
Main content	272	\N
Left bar	273	\N
Left bar	283	\N
Right bar	284	\N
Main content	285	\N
Left bar	286	\N
Right bar	287	\N
Main content	288	\N
Left bar	289	\N
Right bar	290	\N
Main content	291	\N
Left bar	292	\N
Right bar	293	\N
Main content	294	\N
Left bar	295	\N
Right bar	296	\N
Main content	297	\N
Left bar	298	\N
Right bar	299	\N
Main content	300	\N
Left bar	301	\N
Right bar	302	\N
Main content	303	\N
Left bar	304	\N
Right bar	305	\N
Main content	306	\N
Left bar	307	\N
Right bar	308	\N
Main content	309	\N
Right bar	310	\N
Main content	311	\N
Left bar	312	\N
Right bar	313	\N
Main content	314	\N
Left bar	315	\N
Right bar	316	\N
Main content	317	\N
Left bar	318	\N
Right bar	319	\N
Main content	320	\N
Left bar	321	\N
Right bar	322	\N
Main content	323	\N
Left bar	327	\N
Right bar	328	\N
Main content	329	\N
Right bar	330	\N
Left bar	331	\N
Right bar	332	\N
Main content	333	\N
Left bar	337	\N
Right bar	338	\N
Main content	339	\N
Left bar	340	\N
Right bar	341	\N
Main content	342	\N
Right bar	343	\N
Main content	344	\N
Left bar	345	\N
Right bar	346	\N
Left bar	347	\N
Right bar	348	\N
Right bar	349	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 349, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: epiwork
--



INSERT INTO cms_title VALUES ('sv', 'avsluta', 53, 76, 'avsluta', '2011-03-15 12:52:10+01', 'avsluta', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('en', 'Terms of Service', 5, 5, 'terms', '2010-01-17 11:35:50+01', 'terms', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('en', 'Privacy Policy', 6, 6, 'privacy', '2010-01-17 11:36:01+01', 'privacy', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'login_page', 50, 73, 'login_page', '2011-03-09 14:01:42+01', 'login_page', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Om Hälsorapport', 30, 37, 'om', '2010-12-09 17:16:43+01', 'om', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Frågor & svar', 11, 16, 'faq', '2010-10-14 15:10:48+02', 'faq', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Dashboard', 57, 80, 'dashboard', '2011-10-31 16:04:48+01', 'dashboard', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Länkar', 62, 85, 'lankar', '2011-11-21 13:07:01+01', 'lankar', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Karta', 49, 72, 'karta', '2011-02-08 09:59:45+01', 'karta', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'forkylning', 73, 96, 'karta/forkylning', '2012-01-19 11:41:17+01', 'forkylning', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'länkartest', 65, 88, 'lankartest', '2011-12-13 12:00:13+01', 'lankartest', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'tack', 77, 100, 'tack', '2012-06-05 16:58:30+02', 'tack', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'andeltabell', 88, 111, 'andeltabell', '2013-01-28 17:33:51+01', 'andeltabell', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Kartatest', 25, 50, 'kartatest', '2011-01-15 00:53:07+01', 'kartatest', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Resultat', 75, 98, 'resultat', '2012-02-28 17:14:44+01', 'resultat', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Fakta om datainsamlingen', 24, 29, 'fakta-om-datainsamlingen', '2010-10-22 13:57:58+02', 'fakta-om-datainsamlingen', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'AndraFragor', 54, 77, 'andrafragor', '2011-06-10 15:55:43+02', 'andrafragor', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Nyhetsarkiv', 81, 104, 'nyhetsarkiv', '2012-11-06 16:51:26+01', 'nyhetsarkiv', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Kontakt', 29, 36, 'contact', '2010-12-09 14:10:56+01', 'contact', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'surveys', 79, 102, 'surveys', '2012-06-07 11:29:04+02', 'surveys', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Registrera', 56, 79, 'register', '2011-10-31 15:04:36+01', 'register', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'utvardering', 80, 103, 'surveys/utvardering', '2012-06-07 11:29:23+02', 'utvardering', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'sent', 61, 84, 'contact/sent', '2011-11-11 11:32:27+01', 'sent', true, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'utvardering', 78, 101, 'utvardering', '2012-06-07 11:20:52+02', 'utvardering', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'magsjuka', 72, 95, 'karta/magsjuka', '2012-01-19 11:41:02+01', 'magsjuka', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'dokument', 4, 41, 'dokument', '2011-01-14 13:08:08+01', 'dokument', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'andelskarta', 74, 97, 'karta/andelskarta', '2012-02-28 10:31:09+01', 'andelskarta', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'veckovisa', 76, 99, 'karta/veckovisa', '2012-03-16 16:07:35+01', 'veckovisa', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Hem', 7, 44, 'hem', '2011-01-15 00:43:04+01', 'hem', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'accounts', 90, 113, 'accounts', '2013-11-04 16:21:57+01', 'accounts', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'register', 91, 114, 'accounts/register', '2013-11-04 16:22:22+01', 'register', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Gamlasidor', 92, 115, 'gamlasidor', '2013-11-04 16:38:21+01', 'gamlasidor', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'fragorna', 87, 110, 'gamlasidor/fragorna', '2012-12-21 12:44:03+01', 'fragorna', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'sasongen11-12', 83, 106, 'gamlasidor/sasongen11-12', '2012-11-19 18:21:01+01', 'sasongen11-12', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Jag vill vara med', 9, 14, 'gamlasidor/jag-vill-vara-med', '2010-10-14 10:16:11+02', 'jag-vill-vara-med', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Flera profiler ', 52, 75, 'gamlasidor/flera-profiler', '2011-03-10 10:23:32+01', 'flera-profiler', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Länkargamla', 58, 81, 'gamlasidor/lankargamla', '2011-10-31 17:03:19+01', 'lankargamla', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Influensaskola', 41, 64, 'gamlasidor/influensaskola', '2011-01-27 13:44:23+01', 'influensaskola', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Varför?', 12, 17, 'gamlasidor/varfor', '2010-10-15 15:36:59+02', 'varfor', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Influensavaccination', 47, 70, 'gamlasidor/influensaskola/influensavaccination', '2011-01-27 13:59:49+01', 'influensavaccination', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'omepiwork', 82, 105, 'gamlasidor/omepiwork', '2012-11-12 10:55:09+01', 'omepiwork', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'utvardering11-12', 84, 107, 'gamlasidor/utvardering11-12', '2012-11-19 18:32:53+01', 'utvardering11-12', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Hjälp', 63, 86, 'hjalp', '2011-11-21 16:14:23+01', 'hjalp', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Influensa', 40, 63, 'gamlasidor/influensaskola/influensa', '2011-01-27 13:43:49+01', 'influensa', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Frågeförmulär', 3, 13, 'survey', '2010-10-01 08:09:35+02', 'survey', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'tack', 60, 83, 'survey/tack', '2011-11-08 11:50:56+01', 'tack', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Förkylningar', 42, 65, 'gamlasidor/influensaskola/forkylning', '2011-01-27 13:56:55+01', 'forkylning', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Pandemier', 43, 66, 'gamlasidor/influensaskola/pandemier', '2011-01-27 13:57:32+01', 'pandemier', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Material', 85, 108, 'gamlasidor/material', '2012-11-21 11:33:09+01', 'material', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Så mäts influensaaktiviteten i Sverige', 44, 67, 'gamlasidor/influensaskola/sa-mats-influensaaktivitet', '2011-01-27 13:57:40+01', 'sa-mats-influensaaktivitet', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Så sprids influensavirus', 45, 68, 'gamlasidor/influensaskola/sa-sprids-influensavirus', '2011-01-27 13:58:02+01', 'sa-sprids-influensavirus', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Så undviker du att bli smittad', 46, 69, 'gamlasidor/influensaskola/sa-undviker-du-att-bli-smittad', '2011-01-27 13:59:18+01', 'sa-undviker-du-att-bli-smittad', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Film med Annika', 39, 62, 'gamlasidor/influensaskola/film', '2011-01-27 13:35:33+01', 'film', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Frågesport', 55, 78, 'gamlasidor/influensaskola/fragesport', '2011-10-07 15:46:24+02', 'fragesport', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'Influensan förr', 67, 90, 'gamlasidor/influensaskola/forr', '2011-12-22 11:50:35+01', 'forr', false, '', '', '', '', '', '');
INSERT INTO cms_title VALUES ('sv', 'kur', 68, 91, 'gamlasidor/influensaskola/kur', '2011-12-22 14:41:21+01', 'kur', false, '', '', '', '', '', '');




--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('cms_title_id_seq', 115, true);


--
-- Data for Name: cmsplugin_contestplugin; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cmsplugin_contestplugin (cmsplugin_ptr_id, title) FROM stdin;
\.


--
-- Data for Name: cmsplugin_file; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cmsplugin_file (cmsplugin_ptr_id, file, title) FROM stdin;
1223	cms_page_media/85/affisch-influensakoll-2012.pdf	Influensakolls affisch 2012-13
1224	cms_page_media/85/pressmeddelande-influensakoll-2012.pdf	Pressmeddelande
1230	cms_page_media/85/influensakoll-informationsblad-2012.pdf	Influensakolls infoblad 2012-13
1308	cms_page_media/30/InbjudanHalsorapport_vuxen.pdf	Inbjudan till Hälsorapport
1309	cms_page_media/30/InfobladHalsorapport_vuxen.pdf	Informationsbladet
\.


--
-- Data for Name: cmsplugin_latestentryplugin; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cmsplugin_latestentryplugin (cmsplugin_ptr_id, title, "limit") FROM stdin;
\.


--
-- Data for Name: cmsplugin_link; Type: TABLE DATA; Schema: public; Owner: epiwork
--

INSERT INTO cmsplugin_link VALUES ('', 440, 'Så mäts influensaaktiviteten i Sverige', 44, '');
INSERT INTO cmsplugin_link VALUES ('', 738, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 648, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 431, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 447, 'Läs mer...', 47, '');
INSERT INTO cmsplugin_link VALUES ('', 570, 'kontakta oss', 29, '');
INSERT INTO cmsplugin_link VALUES ('', 643, 'Hem', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 433, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 432, 'FAQ', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 767, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 439, 'Läs mer...', 43, '');
INSERT INTO cmsplugin_link VALUES ('', 268, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 446, 'Influensavaccination', 47, '');
INSERT INTO cmsplugin_link VALUES ('', 445, 'Läs mer...', 46, '');
INSERT INTO cmsplugin_link VALUES ('', 444, 'Så undviker du att bli smittad', 46, '');
INSERT INTO cmsplugin_link VALUES ('', 547, 'Läs mer.', 52, '');
INSERT INTO cmsplugin_link VALUES ('', 443, 'Läs mer...', 45, '');
INSERT INTO cmsplugin_link VALUES ('', 546, 'Profil', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 442, 'Så sprids influensavirus', 45, '');
INSERT INTO cmsplugin_link VALUES ('', 441, 'Läs mer...', 44, '');
INSERT INTO cmsplugin_link VALUES ('', 438, 'Pandemier', 43, '');
INSERT INTO cmsplugin_link VALUES ('', 435, 'Läs mer...', 42, '');
INSERT INTO cmsplugin_link VALUES ('', 434, 'Förkylning', 42, '');
INSERT INTO cmsplugin_link VALUES ('', 684, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 325, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 863, 'samlingssida', 62, '');
INSERT INTO cmsplugin_link VALUES ('', 1196, 'Om Influensakoll', 30, '');
INSERT INTO cmsplugin_link VALUES ('', 1342, 'Gå med i Hälsorapport', 91, '');
INSERT INTO cmsplugin_link VALUES ('', 1179, 'Klicka här för att komma till Råd från förr', 67, '');
INSERT INTO cmsplugin_link VALUES ('', 1315, 'halsorapport@folkhalsomyndigheten.se', NULL, 'halsorapport@folkhalsomyndigheten.se');
INSERT INTO cmsplugin_link VALUES ('http://www.who.int/influenza/vaccines/virus/en/', 470, 'hemsida', NULL, '');
INSERT INTO cmsplugin_link VALUES ('http://www.google.org/flutrends/', 457, 'Google flu trends', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 316, 'här', 24, '');
INSERT INTO cmsplugin_link VALUES ('', 452, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 454, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 544, 'Gå till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 543, 'rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 308, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 309, 'Fakta om datainsamlingen', 24, '');
INSERT INTO cmsplugin_link VALUES ('', 311, 'Varför är min insats viktig?', 12, '');
INSERT INTO cmsplugin_link VALUES ('http://192.168.197.68/accounts/register/', 638, 'gå med', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 410, 'Se filmen här.', 12, '');
INSERT INTO cmsplugin_link VALUES ('', 649, 'Jag vill gå med i Influensakoll', 9, '');
INSERT INTO cmsplugin_link VALUES ('', 331, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 458, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 270, 'Varför är min insats viktig?', 12, '');
INSERT INTO cmsplugin_link VALUES ('', 1343, 'Kontakta oss', 29, '');
INSERT INTO cmsplugin_link VALUES ('', 739, 'Jag vill gå med i Influensakoll', 9, '');
INSERT INTO cmsplugin_link VALUES ('', 315, 'halsorapport@folkhalsomyndigheten.se', NULL, 'halsorapport@folkhalsomyndigheten.se');
INSERT INTO cmsplugin_link VALUES ('', 271, 'Fakta om datainsamlingen', 24, '');
INSERT INTO cmsplugin_link VALUES ('', 274, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 461, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('http://www.thenakedscientists.com/HTML/content/kitchenscience/garage-science/exp/how-fast-is-a-sneeze/', 462, 'Titta på en nysning i slowmotion', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 466, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 471, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 644, 'Fakta om datainsamlingen', 24, '');
INSERT INTO cmsplugin_link VALUES ('', 411, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 418, 'Läs mer...', 40, '');
INSERT INTO cmsplugin_link VALUES ('', 416, 'Influensa', 40, '');
INSERT INTO cmsplugin_link VALUES ('', 685, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 456, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 460, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 464, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 468, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 415, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('http://arkiv.mitti.se:4711/2011/48/sodermalm/MIIS-20111129-A-016-A.pdf', 864, 'artiklarna', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 729, 'Jag vill gå med i Influensakoll', 9, '');
INSERT INTO cmsplugin_link VALUES ('', 964, 'Sjukdomsläget: magsjuka', 72, '');
INSERT INTO cmsplugin_link VALUES ('', 906, 'Influensaskola', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 1063, 'Klicka här', 49, '');
INSERT INTO cmsplugin_link VALUES ('http://www.influenzanet.eu/', 1311, 'här', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 473, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 476, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 480, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 538, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 740, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 645, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 650, 'Influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 639, 'hanterar flera profiler. ', 52, '');
INSERT INTO cmsplugin_link VALUES ('', 1317, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 1247, 'Sjukdomsläget: influensa', 49, '');
INSERT INTO cmsplugin_link VALUES ('', 1188, 'Om Influensakoll', 30, '');
INSERT INTO cmsplugin_link VALUES ('', 680, 'här', 52, '');
INSERT INTO cmsplugin_link VALUES ('', 686, 'Influensakolls resultat', 49, '');
INSERT INTO cmsplugin_link VALUES ('http://www.influenzanet.org/', 600, 'Influenzanet', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 615, 'Gå med', 9, '');
INSERT INTO cmsplugin_link VALUES ('', 611, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 612, 'Kontakta oss', 29, '');
INSERT INTO cmsplugin_link VALUES ('', 613, 'Influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 616, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 1292, 'Läs mer... ', 75, '');
INSERT INTO cmsplugin_link VALUES ('', 479, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 730, 'Gå med i Hälsorapport', 91, '');
INSERT INTO cmsplugin_link VALUES ('', 394, 'Kontakta oss', 29, '');
INSERT INTO cmsplugin_link VALUES ('', 395, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('http://www.who.int/influenza/surveillance_monitoring/updates/en/index.html', 660, 'senaste influensauppdatering', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 592, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 965, 'Sjukdomsläget: förkylning', 73, '');
INSERT INTO cmsplugin_link VALUES ('', 1064, 'Klicka här', 72, '');
INSERT INTO cmsplugin_link VALUES ('http://ecdc.europa.eu/en/healthtopics/seasonal_influenza/Pages/index.aspx', 661, 'säsongsinfluensan', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 799, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 1318, 'Om Hälsorapport', 30, '');
INSERT INTO cmsplugin_link VALUES ('', 735, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 764, 'Jag vill gå med i Influensakoll', 9, '');
INSERT INTO cmsplugin_link VALUES ('', 1193, 'Fakta om datainsamlingen', 24, '');
INSERT INTO cmsplugin_link VALUES ('', 1195, 'Om EPIWORK', 82, '');
INSERT INTO cmsplugin_link VALUES ('', 1345, 'Vår hjälpsida', 63, '');
INSERT INTO cmsplugin_link VALUES ('', 1094, 'Sjukdomsläget: influensa', 49, '');
INSERT INTO cmsplugin_link VALUES ('', 640, 'Fakta om datainsamlingen.', 24, '');
INSERT INTO cmsplugin_link VALUES ('', 908, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('', 1214, 'Utvärderingsenkäten 2011-12 ', 84, '');
INSERT INTO cmsplugin_link VALUES ('', 1335, 'halsorapport@folkhalsomyndigheten.se', NULL, 'halsorapport@folkhalsomyndigheten.se');
INSERT INTO cmsplugin_link VALUES ('', 851, 'Tillbaka till startsidan', 7, '');
INSERT INTO cmsplugin_link VALUES ('http://www.forskning.se/', 742, 'www.forskning.se', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 682, '"mitt konto"', 9, '');
INSERT INTO cmsplugin_link VALUES ('', 688, 'Rapportera för en annan profil', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 765, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 1340, 'Om Hälsorapport', 30, '');
INSERT INTO cmsplugin_link VALUES ('http://www.1177.se/Fakta-och-rad/Sjukdomar/Magsjuka---diarre-och-krakningar/', 1322, 'Läs mer om magsjuka', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 1220, 'Nyheter', 62, '');
INSERT INTO cmsplugin_link VALUES ('', 1231, 'Länkar', 58, '');
INSERT INTO cmsplugin_link VALUES ('', 1249, 'Klicka här', 73, '');
INSERT INTO cmsplugin_link VALUES ('', 1232, 'här', 30, '');
INSERT INTO cmsplugin_link VALUES ('', 642, 'influensakoll@smi.se', NULL, 'influensakoll@smi.se');
INSERT INTO cmsplugin_link VALUES ('', 766, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('http://www.1177.se/', 910, '1177', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 1291, 'Sjukdomsläget: veckodiagram', 75, '');
INSERT INTO cmsplugin_link VALUES ('http://www.bwz.se/smi/b.aspx?l=4966A86C-CBA5-47E8-A141-6CEC767C1D12&r=1&rcrc=8C7F66C3', 862, 'Läs mer...', NULL, '');
INSERT INTO cmsplugin_link VALUES ('http://www.1177.se/Fakta-och-rad/Sjukdomar/Influensa/', 1323, 'Läs mer om influensa', NULL, '');
INSERT INTO cmsplugin_link VALUES ('', 1246, 'Sjukdomsläget: förkylning', 73, '');
INSERT INTO cmsplugin_link VALUES ('', 368, 'Frågor och svar', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 370, 'Läs mer om Influensakoll', 30, '');
INSERT INTO cmsplugin_link VALUES ('', 1341, 'Rapportera', 3, '');
INSERT INTO cmsplugin_link VALUES ('', 1221, 'Nyhetsarkiv', 81, '');
INSERT INTO cmsplugin_link VALUES ('', 425, 'Tillbaka till influensaskolan', 41, '');
INSERT INTO cmsplugin_link VALUES ('', 1191, 'Fick du en inbjudan på posten?', 30, '');
INSERT INTO cmsplugin_link VALUES ('', 424, 'FAQ', 11, '');
INSERT INTO cmsplugin_link VALUES ('', 422, 'Pandemier', 43, '');
INSERT INTO cmsplugin_link VALUES ('', 420, 'Tillbaka till influensaskolan', 41, '');

--
-- Data for Name: cmsplugin_picture; Type: TABLE DATA; Schema: public; Owner: epiwork
--


INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/42/nysning_färg.jpg', 436, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/7/nyheter_1.png', 1352, '', 81, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/84/varfordelta11-12best.PNG', 1212, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/67/influensagammal_liten.png', 905, '', 68, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/72/kartforklaring_parentes.PNG', 992, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/43/pigs.jpg', 453, '', NULL, 'left', '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/83/kumulativaprofiler_11-12_2.PNG', 1208, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('http://www.influensakoll.se/sv/accounts/register/', 'cms_page_media/72/gamedgra.PNG', 1103, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/46/washing_hands_.jpg', 465, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/47/_injection_needle_small.jpg', 469, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/65/stars_2.png', 889, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/65/starsstars.png', 890, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/43/Pandemier_.jpg', 599, 'Pandemier i Sverige 1900-talet', NULL, NULL, 'Pandemier i Sverige 1900-talet');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/41/ANNIKA-LINDE-.jpg', 506, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/65/starsstars_small_1.png', 891, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/7/snabblank2.PNG', 1344, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/84/forbattranyhetsbrev11-12best.PNG', 1213, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/72/rapporteragra.PNG', 1104, '', 3, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/75/agi_2014_vecka47.png', 1385, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('http:\\www.folkhalsomyndigheten.se', 'cms_page_media/7/FolkhalsomyndighetenLogga.png', 1301, 'www.folkhalsomyndigheten.se', NULL, NULL, 'Folkhälsomyndighetens logotyp');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/74/kartforklaringANDEL.png', 1093, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/74/forrfa.png', 1096, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/75/ariili_2014_vecka47.png', 1384, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/65/jullogga_2.png', 892, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/83/aldersgrupp11-12.PNG', 1209, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/49/forklaringandel.PNG', 1251, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/78/tilllenkaten.PNG', 1165, '', 80, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/68/influensagammal_page1.png', 903, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/65/nyheter-illu.gif', 861, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/76/kartforklaring.png', 1117, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/73/forklaringandel.PNG', 1252, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/49/forklaringandel-fin-liten.png', 1276, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/68/influensagammal_page2.png', 904, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('http://www.folkhalsomyndigheten.se', 'cms_page_media/24/FolkhalsomyndighetenLogga.png', 1320, 'Logotyp', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/25/kartforklaring_1.png', 944, '', NULL, NULL, '');
INSERT INTO cmsplugin_picture VALUES ('', 'cms_page_media/40/influensa-a-h1n1-01-fargad.jpg', 421, '', NULL, NULL, '');






COPY cmsplugin_snippetptr (cmsplugin_ptr_id, snippet_id) FROM stdin;
569	20
568	20
704	30
437	18
703	30
1046	30
705	30
475	13
706	30
607	21
619	22
1263	28
943	15
707	30
758	11
701	30
1264	30
1097	15
708	30
641	11
627	24
1008	35
1087	30
702	30
1225	11
709	30
1045	30
1262	11
\.



--
-- Data for Name: cmsplugin_surveychartplugin; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cmsplugin_surveychartplugin (cmsplugin_ptr_id, chart_id) FROM stdin;
\.


--
-- Data for Name: cmsplugin_text; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY cmsplugin_text (body, cmsplugin_ptr_id) FROM stdin;
<h1>Privacy Policy</h1>	1
<h1>Terms of Service</h1>	2
<p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" title="Link - Tillbaka till startsidan" id="plugin_obj_480" /></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" title="Link - Frågor och svar" id="plugin_obj_308" /></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Fakta om datainsamlingen" title="Link - Fakta om datainsamlingen" id="plugin_obj_309" /></p>	305
<h1><a name="999">Frågor och svar</a></h1>\n<p>På den här sidan har vi samlat vanliga frågor och svar. Om du inte hittar svaret på din fråga är du välkommen att <a href="http://www.halsorapport.se/contact/">kontakta oss.</a> </p>\n\n\n\n<h2>Frågor om ditt deltagande</h2>\n<p>\n<a href="#1">Hur gör jag för att gå med?</a>\n<br/>\n<a href="#2">Hur berättar jag att jag är sjuk?</a>\n<br/>\n<a href="#23">Hur ska man definiera sjuk?</a>\n<br/>\n<a href="#4">Vad gör jag om jag har en kronisk sjukdom?</a> \n<br/>\n<a href="#26">Jag ska ut och resa - kan jag hoppa över en vecka?</a> \n<br/>\n<a href="#5">Vad gör ni med den information jag uppger?</a>\n<br/>\n<a href="#77">Hur gör jag för att avsluta mitt deltagande?</a> <br/>\n</p>\n\n<h2>Frågor om influensa och luftvägsinfektioner</h2>\n<p>\n<a href="#8">Vilka är symtomen på influensa?</a>\n<br/><a href="#10">Vad händer i kroppen när jag smittas av influensa?</a> <br/>\n<a href="#11">Hur sprids influensavirus?</a>\n<br/>\n<a href="#12">Hur kan man undvika att bli smittad?</a>\n<br/><a href="#14">Varför är det så att folk får influensa mest på vintern?</a> <br/><a href="#16">Vad är en influensaepidemi?</a> <br/>\n<a href="#17">Vad är en pandemi?</a> </p>\n\n<h2>Frågor om vinterkräksjuka </h2>\n<p>\n<a href="#15">Vad orsakar vinterkräksjuka?</a> <br/><a href="#18">Vilka är symtomen på magsjuka?</a><br/><a href="#19">Hur sprids vinterkräksjuka?</a><br/><a href="#20">Hur kan man undvika att bli smittad?</a><br/><a href="#21">Varför är det så att folk får vinterkräksjuka mest på vintern?</a></p><hr/>\n\n<h2>Frågor om ditt deltagande</h2>\n<a name="1"><h3>Hur gör jag för att gå med?</h3></a>\n<p>1.\tSkapa ett användarkonto genom att klicka på <strong>gå med</strong> längst upp till höger på sidan (blå knapp)<br/>\n</p><p>2.\tEn aktiveringslänk skickas till den e-postadress du angivit. Klicka på länken för att aktivera ditt konto<br/>\n</p><p>3.\tLogga sedan in<br/>\n</p><p>4. Fyll i den id-kod som står tryckt på inbjudan</p><p>4.\tBesvara bakgrundsformuläret<br/> \n</p><p>Nu är du en av Hälsorapports rapportörer. Kom ihåg att rapportera varje vecka oavsett om du har några symtom eller inte. <br/> \n<a href="#999">Tillbaka</a>\n<br/>\n</p><hr/>\n\n<a name="2"><h3>Hur berättar jag att jag är sjuk?</h3></a>\n<p>Varje vecka skickas en e-post till dig med en länk till ett frågeformulär. Det är viktigt att fylla i formuläret oavsett om du har några symptom eller inte. För att rapportera måste du först skapa ett användarkonto (<a href="#1">Se fråga 1.</a>).\n<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="23"><h3>Hur ska man definiera sjuk?</h3></a>\n<p>Vi tänker att man är sjuk när man har något eller några symptom som man normalt inte har som frisk eller i sitt allmäntillstånd och som troligen beror på en infektion. Exempelvis symptom på snuva/förkylning, influensa, magsjuka, mm. Att man rapporterar sig som sjuk till Hälsorapport behöver *inte* betyda att man stannat hemma från jobbet/skolan eller mår mycket dåligt. </p><p><a href="https://www.halsorapport.se/media/cms/wymeditor/iframe/default/wymiframe.html#999">Tillbaka</a> </p><a name="4"><h3>Vad gör jag om jag har en kronisk sjukdom</h3></a>\n<p>Om du har en kronisk sjukdom så kan du ändå vara med i Hälsorapport. Det gäller även om du har en sjukdom som ger liknande symptom som de vi frågar om varje vecka, till exempel kronisk magsjuka, Crohn's sjukdom, KOL, eller astma. Vänligen rapportera bara sådana symptom som är ovanliga för dig och som kan bero på en infektion, exempelvis influensa eller vinterkräksjuka. </p><p>Om du till exempel har en kronisk hosta eller diarré så behöver du inte rapportera detta varje vecka. Du känner säkert själv bäst om det är något nytt på gång eller dina kroniska besvär. </p><p><a href="#999">Tillbaka</a> </p>\n\n<a name="26"><h3>Jag ska ut och resa - kan jag hoppa över en vecka?</h3></a>\n<p>Om du ska resa bort någon eller flera veckor så går det att försöka vara med ändå, om du har tillgång till din mejl och Internet. Om det inte går så går det bra att hoppa över de veckorna. Då rapporterar du först när du är tillbaka. </p><p><a href="https://www.halsorapport.se/media/cms/wymeditor/iframe/default/wymiframe.html#999">Tillbaka</a> </p><a name="5"><h3>Vad gör ni med den information jag uppger?</h3></a>\n<p>Var vänlig se sidan <a href="http://www.halsorapport.se/fakta-om-datainsamlingen/">Fakta om datainsamlingen.</a> \n<br/> \n<a href="#999">Tillbaka</a></p>\n\n<hr/>\n\n\n<a name="77"><h3>Hur gör jag för att avsluta mitt deltagande?</h3></a>\n<p>Du kan avsluta ditt deltagande genom att skicka ett e-postmeddelande till halsorapport@folkhalsomyndigheten.se där du anger ditt användarnamn.<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<h2>Frågor om influensa och luftvägsinfektioner</h2>\n<a name="8"><h3>Vilka är symtomen på influensa?</h3></a>\n<p>Symtomen kommer ofta plötsligt och består av frossa, hög feber, huvudvärk, muskelvärk och hosta. Det värsta brukar vara över efter några dagar och efter någon vecka är många så friska att de kan återgå till arbetet, men hosta och trötthet kan hänga i ett tag.<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="10"><h3>Vad händer i kroppen när jag smittas av influensa?</h3></a>\n<p>Influensaviruset sätter sig i luftvägarna och skadar cellerna där.  Immunförsvaret känner snabbt att viruset är främmande för kroppen och en rad processer sätter igång som gör att vi känner oss sjuka i hela kroppen. Immunförsvarets vita blodkroppar aktiveras i blodet vid en infektion och skickar ut signaler som påverkar området i hjärnan som reglerar kroppstemperaturen vilket gör att vi får feber. Feber är ett av naturens sätt att göra miljön i kroppen otrivsam för viruset eftersom virus trivs bäst i 37 grader – den temperatur som de flesta har när de är friska.<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="11"><h3>Hur sprids influensavirus?</h3></a>\n<p>Influensavirus är ett luftburet virus. Det smittar genom små partiklar som bär viruset i luften (aerosol), saliv- eller sekretdroppar eller kroppskontakt. Viruset tar sig in i luftvägarna genom inandningen. Från det att man blir smittat tar det 1 till 3 dygn innan man blir sjuk. \n</p><p>Influensasjukdom kan orsakas av två huvudtyper av influensavirus, influensavirus typ A och B. Influensavirus förändrar sig ständigt, och därför kan vi bli sjuka igen, trots att vi haft samma typ tidigare.<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="12"><h3>Hur kan man undvika att bli smittad?</h3></a>\n<p>Det är viktigt att den som är sjuk inte hostar och nyser rakt ut. Gör till en vana att alltid hosta och nysa i armvecket och använda pappersnäsdukar som sedan slängs i en soppåse. Handtvätt med tvål och vatten kan minska risken att en sjuk sprider smitta och att en frisk smittas. Komplettera gärna med handsprit.</p>\n<p>\nOm en person med misstänkt influensa måste träffa andra är det bra att hålla så stort avstånd som möjligt och att inte ta i hand eller kyssa på kind.  Friska personer bör om möjligt undvika närkontakt med misstänkta influensasjuka. Friska personer bör undvika att röra vid ögon, näsa och mun eftersom influensavirus kan ha fastnat på ett föremål som de nyligen rört vid.\n<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="14"><h3>Varför är det så att folk får influensa mest på vintern?</h3></a>\n<p>Influensavirus sprider sig lättast på vintern och början på våren. Man tror att detta beror på att människor oftare är inomhus och därmed närmare varandra under den "kalla årstiden". Dessutom är luften i ett hus under den kalla perioden ofta torr, som ett resultat av detta förblir influensavirus aktivt längre.\n<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="16"><h3>Vad är en influensaepidemi?</h3></a>\n<p>En epidemi uppstår när antalet fall av influensa i ett visst område är betydligt högre än antalet influensafall under resten av året.<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="17"><h3>Vad är en pandemi?</h3></a>\n<p>En pandemi är en världsomfattande epidemi som orsakas av en ny virussubtyp. En ny subtyp uppstår när det sker en stor förändring av viruspartikelns yta med vilken slemhinnan i lungorna blir penetrerad. Eftersom de flesta människor inte har haft chansen att bli immuna mot den nya virussubtypen, kan smittan bli utbredd. <br/> \n<a href="#999">Tillbaka</a> </p>\n\n<h2>Frågor om vinterkräksjuka</h2>\n\n<a name="15"><h3>Vad orsakar vinterkräksjuka?</h3></a>\n<p>Vinterkräksjuka orsakas av calicivirus. I gruppen calicivirus ingår noro- och sapovirus. Vi får stora återkommande årliga epidemier i samhället, framförallt på vinterhalvåret. Calicivirus är också vanligt som smitta på sjukhus. Inte sällan måste hela sjukhusavdelningar stängas för sanering. Flera utbrott knutna till mat rapporteras också varje år. <br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="18"><h3>Vilka är symtomen på vinterkräksjuka?</h3></a>\n<p>Symtomen är häftiga kräkningar, diarré, ont i magen, måttlig feber, huvudvärk och muskelvärk. Man kan känna sig riktigt sjuk och dålig. Under sjukdomstiden bör man se till att dricka mycket och ersätta den vätska man förlorar. Läs mer om vinterkräksjukan på <a href="http://www.1177.se/Skane/Fakta-och-rad/Sjukdomar/Magsjuka---diarre-och-krakningar/">1177 Vårdguiden.</a>\n<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="19"><h3>Hur sprids vinterkräksjuka?</h3></a>\n<p>Calicivirus som orsakar vinterkräksjuka sprids oftast från människa till människa via smittad, kall mat. Smittan kan även spridas via direktkontakt eller via dryck, till exempel om någon som är smittad hanterar drycken. Om man kräks häftigt kan smittan spridas genom luften i form av små droppar.\n<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="20"><h3>Hur kan man undvika att bli smittad?</h3></a>\n<p>För att undvika att magsjuka sprids är det extra viktigt med noggrann hygien. Det är bra att tvätta händerna med flytande tvål före måltider och efter toalettbesök. En egen handduk eller engångshanddukar behövs. \n<br/>\n<br/>\nSmittan sprids ofta genom maten, till exempel om den som är magsjuk lagar mat till andra. Därför är det bra att undvika att laga mat så länge man har diarréer. Om man har variga sår på fingrarna ska man inte alls laga mat. Variga infektioner är ofta orsakade av stafylokocker, som kan ge matförgiftning om de hamnar i mat.\n<br/> \n<a href="#999">Tillbaka</a> </p>\n\n<a name="21"><h3>Varför är det så att folk får vinterkräksjuka mest på vintern?</h3></a>\n<p>Den här typen av infektioner är vanligast under vinterhalvåret när smittspridningen ökar av att människor lever tätare tillsammans inomhus.\n<br/> \n<a href="#999">Tillbaka</a> </p><h3>Fler frågor?</h3>\n<p>Har du fortfarande frågor? <a href="http://www.halsorapport.se/contact/">Kontakta oss.</a> </p>	1314
<h2>Gå ur Influensakoll</h2><p>Du kan avsluta ditt deltagande genom att skicka ett e-postmeddelande \r\ntill influensakoll@smi.se. Ange ditt användarnamn.</p>	561
<h1>Förkylning</h1><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_431" title="Länk - Tillbaka till influensaskolan"/></p><p>Förkylning\n är en av de allra vanligaste infektionssjukdomarna och drabbar vuxna\n \npersoner i\ngenomsnitt en till två gånger per år. Barn drabbas mer än dubbelt så \nofta. En förkylning är mycket smittsam, framför allt under \nde\nförsta sjukdomsdagarna, och sprids som en luftburen smitta t.ex. vid \nhosta och\nnysning. En förkylning kan också smitta genom direktkontakt, t.ex. via\nhänderna. </p><p>En\nförkylning är nästan alltid orsakad av ett virus. Viruset angriper \nslemhinnorna\ni näsa/svalg, bihålor, mellanöra samt i de övre luftrören. \nDet finns ett mycket stort antal virus som kan ge upphov till\nförkylning. Många av dessa tillhör gruppen rhinovirus, men \nförkylningsvirus kan\nockså återfinnas inom bl.a. coronavirus, parainfluensavirus och \nadenovirus. Eftersom\nen förkylning orsakas av virus blir behandlingen helt inriktad på att \nmildra\nsymtomen. Smärtlindrande och febernedsättande mediciner brukar hjälpa \nliksom\nnässpray och hostmedicin. Rikligt med dryck rekommenderas, framför allt \nnär det\ngäller små barn.</p><p><img src="/+media/cms/images/plugins/image.png" alt="Picture - &lt;empty&gt;" id="plugin_obj_436" title="Picture - &lt;empty&gt;"/></p><p>Klassiska\nsymtom vid förkylning är rinnsnuva och halsont. Vanligen uppträder också\n hosta,\nsom från början i regel är ”torr” men som successivt blir allt mer\n”slembildande”. Andra vanliga symtom är lockkänsla från öronen och \ntryckkänsla\növer bihålorna. Feber förekommer ibland men är i så fall måttlig. \nTrötthet är\nett vanligt symtom.Förkylningssjukdomen\när oftast mycket godartad och har i regel, oberoende av behandling, läkt\n ut\ninom någon vecka. </p><p>Har du frågor om förkylningar? I\ninfluensakolls <img src="/+media/cms/images/plugins/link.png" alt="Link - FAQ" id="plugin_obj_432" title="Link - FAQ"/> hittar du\nsvar på vanliga frågor. Du kan också läsa mer om\nförkylningar på <img src="../../../images/plugins/snippet.png" alt="Snippet - \nhttp://www.smittskyddsinstitutet.se/sjukdomar/forkylning/" id="plugin_obj_437" title="Snippet - \nhttp://www.smittskyddsinstitutet.se/sjukdomar/forkylning/"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_433" title="Link - Tillbaka till influensaskolan"/></p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_703" title="Kodstycke - Twitterbutton"/></p>	430
<h3><strong>SMI har koll på vinterkräksjukan</strong></h3>\n<p><a href="http://smi.se/publikationer/veckorapporter/norovirusrapporter/2012/">Klicka här</a> för att läsa SMI:s veckorapporter över vinterkräksjukan (calicivirus) eller läs mer om calicivirus på <a href="http://smi.se/sjukdomar/calicivirus-noro-och-sapovirus/">SMI:s webbplats</a>. </p>	1018
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: influensa" id="plugin_obj_974" title="Länk - Sjukdomsläget: influensa"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: magsjuka" id="plugin_obj_975" title="Länk - Sjukdomsläget: magsjuka"/></p>	1004
<h1>Influensakolls deltagare 2011-12</h1>\n<p>Under säsongen 2011-12 gick fler än 2658 personer med i Influensakoll och skapade drygt 2800 profiler. Figur 1 visar hur antalet deltagare steg under säsongen. Aktiviteter i media i samband med lanseringen den 17 november 2011 ledde till att ungefär 1000 personer gick med inom en månad. En extra satsning i media i slutet på februari resulterade i att vi kom över 2500-strecket. </p>\n<p><em><strong>Figur 1. Deltagande över tid.</strong></em></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - kumulativaprofiler_11-12.PNG" id="plugin_obj_1208" title="Bild - kumulativaprofiler_11-12.PNG"/></p>\n<p>Genom den bakgrundsenkät som deltagare fyller i när de går med i Influensakoll kan vi veta lite mer om vilka som deltar. Nedan kan du läsa lite mer om hur deltagargruppen såg ut och hur de svarat på utvärderingsenkäten som skickades vid slutet av säsongen. Dessa är preliminära data som kan komma att ändras. En mer utförlig analys av data från säsongen 2011-12 har påbörjats och kommer att pågå under vintern och våren 2012-13. </p>\n<h2>Ålder och kön</h2>\n<p>Av Influensakolls deltagare från 2011-12 var nära två tredjedelar kvinnor och en tredjedel män. De var mellan 0 och 87 år gamla men väldigt få deltagare var över 75 år (se figur 2). Även åldersgruppen unga vuxna (25-34 år) var deltagandet lägre än vad man kunde förvänta sig. Den allra största gruppen var kvinnor i åldersgruppen 35-44. </p>\n<p><em><strong>Figur 2. Åldergruppsfördelning.</strong></em></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - aldersgrupp11-12.PNG" id="plugin_obj_1209" title="Bild - aldersgrupp11-12.PNG"/></p>\n<h2>Geografisk fördelning</h2>\n<p>Deltagarna var geografiskt spridda över hela Sverige. Storstadsregionerna dominerade i rena antal, med cirka 260 i Västra Götaland, 300 i Skåne, och 1000 deltagare i Stockholm. Men, när man analyserar deltagare per invånarantal så leder Västernorrland med fler än 66 deltagare per 100 000 invånare. Platserna två till fem går till Stockholm, Uppsala, Jönköping, och Södermanland. </p>\n<h2>Yrke och utbildning</h2>\n<p>De personer som gick med i Influensakoll under säsongen 2011-12 var till stor del personer med universitetsutbildning. Det var väldigt få personer som inte avslutat grundskolan. De flesta deltagare uppgav att de jobbade inom ett yrke som krävde specialistkompetens eller kontors- och kundservicearbete. </p>\n<h2>Sammanfattning</h2>\n<p>Vi kan säga att deltagare inte utgör ett genomsnitt av Sveriges befolkning. </p>\n<p>Mer utförlig information kommer att publiceras när analysen av alla data från säsongen 2011-12 blir klar under våren, så håll ögonen öppna! </p>	1207
<h1>Instruktioner</h1><p>För att delta i Influensakoll behöver du ett användarkonto. Klicka på <img src="/media/cms/images/plugins/link.png" alt="Länk - gå med" id="plugin_obj_638" title="Länk - gå med"/>, där du anger ett användarnamn, din e-postadress och ett lösenord. <strong>Användarnamnet och lösenordet kan \nbestå av stora och små bokstäverna mellan a och z (inte å, ä, och ö) och siffror och underscore (_) men \ninga mellanslag eller bindestreck.</strong> När du har skapat ditt användarkonto skickas ett \ne-postmeddelande till dig med en länk för att aktivera ditt konto. \n</p><p>\nDu måste ha fyllt 15 år för att delta i Influensakoll. Som målsman kan \ndu rapportera för dina barn eller andra anhöriga genom ditt eget användarkonto. Läs mer om hur man hanterar <img src="/media/cms/images/plugins/link.png" alt="Länk - flera profiler. " id="plugin_obj_639" title="Länk - flera profiler. "/>  \n</p>\n<p>\nGenom att du går med i Influensakoll ger du ditt godkännande till att \nSmittskyddsinstitutet hanterar dina rapporterade uppgifter.<br/> \nAnsvariga för registret är Smittskyddsinstitutet och Karolinska \nInstitutet. <br/>Dina rapporter och svar kommer att behandlas så att \nobehöriga inte kan ta del av dem.</p>\n<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen." id="plugin_obj_640" title="Länk - Fakta om datainsamlingen."/></p><p>Har du frågor om undersökningen eller tekniska problem, vänligen kontakta oss på <img src="/media/cms/images/plugins/link.png" alt="Länk - influensakoll@smi.se" id="plugin_obj_642" title="Länk - influensakoll@smi.se"/>. </p>	637
<p><img src="../../../images/plugins/snippet.png" alt="Snippet - länk till &quot;gå med&quot; G" title="Snippet - länk \r\ntill &quot;gå med&quot; G" id="plugin_obj_391" /></p><p><img src="../../../images/plugins/link.png" alt="Link\r\n - Rapportera" title="Link - Rapportera" id="plugin_obj_390" /></p><p></p><p></p><p></p><p></p><p></p>	220
<h2>Projektet Hälsorapport</h2>\n<h3>Influenzanet</h3>\n<p>Influensakoll är den svenska komponenten i ett Europeiskt system som kallas Influenzanet. Läs mer på projektens gemensamma <a href="http://www.influenzanet.eu/">projektwebbplats</a>.</p>\n<h3>Folkhälsomyndigheten</h3>\n<p>Hälsorapport drivs av Folkhälsomyndigheten, som startade den 1 januari 2014. Folkhälsomyndigheten är en nationell kunskapsmyndighet med ett övergripande ansvar för folkhälsofrågor. Myndigheten är en sammanslagning av Smittskyddsinstitutet, Statens folkhälsoinstitut och de delar av Socialstyrelsen som ansvarar för hälsoskydd och miljöhälso-rapportering. Här kan du besöka Folkhälsomyndighetens <a href="http://www.folkhalsomyndigheten.se/">webbplats</a>.</p>	1312
<h2>Om Hälsorapport</h2><p><strong>Detta är syftet med Hälsorapport</strong></p><p>Målet med Hälsorapport är att bygga upp ett system som gör det enkelt för Folkhälsomyndigheten att bevaka smittläget i Sverige och utifrån detta informera sjukvården, allmänheten och andra myndigheter. Du som deltar i Hälsorapport bidrar genom att rapportera om ditt hälsotillstånd varje vecka och vid behov besvara extra enkäter (högst tre under året).</p><p><strong>Så går rapporteringen till</strong></p><p>Under perioden november 2013 till november 2014 får du som går med i Hälsorapport ett mejlutskick en gång i veckan med frågan om du har insjuknat under den gångna veckan. Om du har varit frisk tar det bara några sekunder att svara. Om du har varit sjuk får du frågor om dina symptom och det kan ta ett par minuter att besvara frågorna. Du kan besvara enkäten med din smarta mobil, läsplatta eller dator.</p><p>Om du har varit sjuk får du efter två veckor en kort enkät där du får ange ifall du har sökt vård för dina symptom och om du har stannat hemma från jobbet eller skolan.</p><p><strong>Inbjudan och informationsblad</strong></p><p>Mer kan du läsa i den inbjudan och det informationsblad som skickats till alla deltagare:</p><p><img src="/media/file_icons/pdf.gif" alt="Fil - Inbjudan till Hälsorapport" id="plugin_obj_1308" title="Fil - Inbjudan till Hälsorapport"/></p><p><img src="/media/file_icons/pdf.gif" alt="Fil - Informationsbladet" id="plugin_obj_1309" title="Fil - Informationsbladet"/></p><p><strong>Så tar vi hand om dina svar</strong></p><p>Den information som du lämnar skyddas av offentlighets- och sekretesslagen och personuppgiftslagen. Det betyder att obehöriga inte kan ta del av den. Läs om hur Folkhälsomyndigheten använder de uppgifter du lämnar på sidan <a href="https://www.halsorapport.se/sv/fakta-om-datainsamlingen/">Fakta om datainsamlingen</a>.</p><p><strong>Influenzanet</strong></p>\n<p>Hälsorapport är del av Influenzanet, ett europeiskt system för webbaserad syndromövervakning. Det har främst använts för att följa förekomsten av influensaliknande sjukdom i befolkningen. Influenzanet startades 2003 i Holland under namnet de Grote Griep Meting (“Den stora influensaundersökningen”). Sedan dess har mellan 20000 och 31000 frivilliga holländare och belgare rapporterat eventuella symtom varje vecka och på så sätt givit information om hur influensa och förkylningar sprider sig i Nederländerna och flamländska Belgien.</p><p>Sedan 2005 har liknande webbaserade rapporteringssystem funnits i Portugal, sedan 2008 i Italien, sedan 2009 England, sedan 2011 i Sverige, Frankrike och delar av Spanien, och sedan 2013 även på Irland och i Danmark. Data om rapporterade symptom i dessa länders befolkningar samlas sedan hösten 2010 i en gemensam Europeisk databas. Informationen som samlas i den Europeiska databasen är avidentifierad och enskilda personers identitet går inte att spåra. Den informationen utvärderas och analyseras av epidemiologer och modellerare inom Influenzanet. </p><p>Läs mer om Influenzanet <img src="/media/cms/images/plugins/link.png" alt="Länk - här" id="plugin_obj_1311" title="Länk - här"/>.</p><p>Om du klickar på det grå området längst ner på sidan (där det står Influenzanet) kan du klicka dig fram till de andra europeiska sajterna genom att klicka på flaggorna för varje land. </p>\n	333
	895
<h1>Vill du sprida Influensakoll vidare?</h1>\n<p>För att förenkla för intresserade personer och organisationer såsom smittskyddsenheterna i Sverige att sprida Influensakoll vidare till allmänheten har vi tagit fram en affisch och ett infoblad som går att spara ner och skriva ut. Mer information om Influensakoll säsongen 2012-13 finns också <img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - här" id="plugin_obj_1232" title="Länk - här"/>.</p>\n<p>Affischen:</p>\n<p><img src="https://www.influensakoll.se/media/file_icons/pdf.gif" alt="Fil - Influensakolls affisch 2012-13" id="plugin_obj_1223" title="Fil - Influensakolls affisch 2012-13"/></p>\n<p>Infobladet:</p>\n<p><img src="https://www.influensakoll.se/media/file_icons/pdf.gif" alt="Fil - Influensakolls infoblad 12-13" id="plugin_obj_1230" title="Fil - Influensakolls infoblad 12-13"/></p>\n<p>Måndagen den 26:e november publicerades följande pressmeddelande: </p>\n<p><img src="https://www.influensakoll.se/media/file_icons/pdf.gif" alt="Fil - Pressmeddelande (embargo till 26:e november)" id="plugin_obj_1224" title="Fil - Pressmeddelande (embargo till 26:e november)"/></p>\n<p><strong>Hör gärna av dig till oss på </strong><a href="mailto:influensakoll@smi.se"><strong>influensakoll@smi.se</strong></a><strong> för mer information eller hjälp. </strong></p>	1222
<h1>Fakta om datainsamlingen</h1>\n<p>De uppgifter som du lämnar skyddas av offentlighets- och sekretesslagen (2009:400, 24 kap. 8 §) och personuppgiftslagen (1998:204). Folkhälsomyndigheten har ansvaret för de data som du lämnar, inklusive mejladress och inloggningsuppgifter. Dina rapporter och svar kommer att behandlas så att obehöriga inte kan ta del av dem. </p><p>Statistiska centralbyrån ansvarar för urvalet av inbjudna och utskicket. Genom att du anmäler dig till Hälsorapport godkänner du att Folkhälsomyndigheten hanterar dina data. Avidentifierade data kan komma att skickas till en europeisk databas. Innan data skickas tar vi bort all personinformation så det inte går att identifiera någon deltagare.</p><p>Enligt personuppgiftslagen och offentlighetsprincipen har du rätt att få ett utdrag på de uppgifter som gäller dig i Folkhälsomyndighetens databas. Du kan också få uppgifterna ändrade om de är felaktiga. Vi skyddar alla registrerade emot obehöriga intrång, och därför kontrollerar vi självklart<br/>identiteten på den som vill få ut sådana uppgifter. Om du vill begära ut dina uppgifter måste du därför kontakta oss och uppge ditt användarnamn, din mejladress och en postadress. Utdragen skickas till dig i ett rekommenderat brev.</p><p>Vi sparar dina uppgifter så länge som de behövs för att genomföra analysarbetet och därefter kommer uppgifterna att gallras i enlighet med gällande regelverk. Analysresultatet redovisas endast på gruppnivå och det går inte att urskilja enskilda personers uppgifter. Sammanställningarna kan<br/>komma att publiceras i vetenskapliga tidskrifter.</p>\n<p>Vill du veta mer eller begära ut dina uppgifter kan du vända dig till <img src="/media/cms/images/plugins/link.png" alt="Länk - halsorapport@folkhalsomyndigheten.se" id="plugin_obj_1315" title="Länk - halsorapport@folkhalsomyndigheten.se"/>.</p>\n	355
<h2>Sveriges regioner och landsting</h2>\n<p>Stockholms läns landsting: <a href="http://www.sll.se/">http://www.sll.se</a></p>\n<p>Landstinget i Uppsala län: <a href="http://www.lul.se/">http://www.lul.se</a></p>\n<p>Landstinget Sörmland: <a href="http://www.dll.se/">http://www.dll.se</a> </p>\n<p>Landstinget i Östergötland: <a href="http://www.lio.se/">http://www.lio.se</a> </p>\n<p>Landstinget i Jönköpings län: <a href="http://www.lj.se/">http://www.lj.se</a> </p>\n<p>Landstinget Kronoberg: <a href="http://www.ltkronoberg.se/">http://www.ltkronoberg.se</a> </p>\n<p>Landstinget i Kalmar län: <a href="http://www.ltkalmar.se/">http://www.ltkalmar.se</a> </p>\n<p>Region Gotland: <a href="http://www.gotland.se/imcms/1027">http://www.gotland.se/imcms/1027</a> </p>\n<p>Landstinget Blekinge: <a href="http://www.ltblekinge.se/">http://www.ltblekinge.se</a> </p>\n<p>Region Skåne: <a href="http://www.skane.se/">http://www.skane.se</a> </p>\n<p>Region Halland: <a href="http://www.regionhalland.se/">http://www.regionhalland.se</a> </p>\n<p>Västra Götalandsregionen: <a href="http://www.vgregion.se/">http://www.vgregion.se</a> </p>\n<p>Landstinget i Värmland: <a href="http://www.liv.se/">http://www.liv.se</a> </p>\n<p>Örebro läns landsting: <a href="http://www.orebroll.se/">http://www.orebroll.se</a> </p>\n<p>Landstinget Västmanland: <a href="http://www.ltv.se/">http://www.ltv.se</a> </p>\n<p>Landstinget Dalarna: <a href="http://www.ltdalarna.se/">http://www.ltdalarna.se</a> </p>\n<p>Landstinget Gävleborg: <a href="http://www.lg.se/">http://www.lg.se</a> </p>\n<p>Landstinget Västernorrland: <a href="http://www.lvn.se/">http://www.lvn.se</a> </p>\n<p>Jämtlands läns landsting: <a href="http://www.jll.se/">http://www.jll.se</a></p>\n<p>Västerbottens läns landsting: <a href="http://www.vll.se/">http://www.vll.se/</a> </p>\n<p>Norrbottens läns landsting: <a href="http://www.nll.se/">http://www.nll.se/</a> </p>	854
<p><strong>Vill du också bidra till att bygga denna karta? </strong></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - gamedgra.PNG" id="plugin_obj_1103" title="Bild - gamedgra.PNG"/></p>\n<p>Eller om du redan är med kan du rapportera hur du mår denna vecka genom länken nedan.</p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - rapporteragra.PNG" id="plugin_obj_1104" title="Bild - rapporteragra.PNG"/></p>	1102
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: förkylning" id="plugin_obj_965" title="Länk - Sjukdomsläget: förkylning"/> </p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: magsjuka" id="plugin_obj_964" title="Länk - Sjukdomsläget: magsjuka"/></p>	963
<h2>Sidan uppgraderad</h2><p>2014-01-10. Idag har vi bytt ut myndighetens logotyp och vår e-postadress på samtliga ställen på webbplatsen, men den gamla e-postadressen fortsätter att fungera fram till sommaren. Hälsorapport fortsätter att drivas av Folkhälsomyndigheten, som blivit till den 1 januari 2014. </p><p>2013-12-05. Idag har Hälsorapport webbplats uppgraderats med några smärre förbättringar. Till exempel har textfälten blivit större i enkäterna och kontrollord har lagts till på kontaktsidan. Webbplatsen ska fungera som vanligt.</p>	1351
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om EPIWORK" id="plugin_obj_1195" title="Länk - Om EPIWORK"/></p>\n\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om Influensakoll" id="plugin_obj_1196" title="Länk - Om Influensakoll"/></p>\n<p><img src="https://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_268" title="Link - Frågor och svar"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Fakta om datainsamlingen" id="plugin_obj_271" title="Link - Fakta om datainsamlingen"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Varför är min insats viktig?" id="plugin_obj_270" title="Link - Varför är min insats viktig?"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fick du en inbjudan på posten?" id="plugin_obj_1191" title="Länk - Fick du en inbjudan på posten?"/></p>	265
<h2>Landstingens smittskyddsenheter</h2>\n<p>Landstingens smittskyddsenheter är den myndighet allmänheten ska vända sig till för att få råd och information i smittskyddsfrågor. Landstingens smittskyddsenheter ansvarar för att förebygga och minska spridningen av smittsamma sjukdomar inom det egna landstinget. Arbetet sker genom epidemiologisk övervakning, smittspårning, information och utbildning. Nedan hittar ni länkar till alla smittskyddsenheterna i Sverige.</p>\n<p><a href="http://www.smittskyddstockholm.se/">Stockholm</a></p>\n<p><a href="http://www.lul.se/default.aspx?id=4241">Uppsala</a> </p>\n<p><a href="http://www.landstingetsormland.se/Startsida/Verksamheter/SmittskyddVardhygien/">Sörmland</a> </p>\n<p><a href="http://www.lio.se/templates/Substart.aspx?id=17457">Östergötland</a></p>\n<p><a href="http://www.lj.se/smittskydd">Jönköping</a></p>\n<p><a href="http://www.ltkronoberg.se/templates/LTKPresentation____2653.aspx">Kronoberg</a></p>\n<p><a href="http://www.ltkalmar.se/lttemplates/SubjectPage____599.aspx">Kalmar</a></p>\n<p><a href="http://www.gotland.se/imcms/29806">Gotland</a></p>\n<p><a href="http://www.ltblekinge.se/smittskyddsenheten">Blekinge</a></p>\n<p><a href="http://www.skane.se/smittskydd">Skåne</a></p>\n<p><a href="http://www.regionhalland.se/smittskydd">Halland</a></p>\n<p><a href="http://www.vgregion.se/smittskydd">Västra Götaland</a></p>\n<p><a href="http://www.smittskyddvarmland.se/">Värmland</a></p>\n<p><a href="http://www.orebroll.se/uso/smittskydd">Örebro</a></p>\n<p><a href="http://www.ltv.se/smittskydd">Västmanland</a></p>\n<p><a href="http://www.ltdalarna.se/smittskydd">Dalarna</a></p>\n<p><a href="http://www.lg.se/smittskydd">Gävleborg</a></p>\n<p><a href="http://www.lvn.se/smittskydd">Västernorrland</a> </p>\n<p><a href="http://www.jll.se/smittskydd">Jämtland</a></p>\n<p><a href="http://www.vll.se/smittskydd">Västerbotten</a></p>\n<p><a href="http://www.nll.se/smittskydd">Norrbotten</a></p>	857
<h2><strong>Visste du att...</strong></h2>\n<p>- Vanlig säsongsinfluensa kan vara en dödlig sjukdom bland åldringar och personer med kroniska sjukdomar</p>\n<p>- “Spanska sjukan”, den pandemiska influensan som härjade 1918-1920, skördade fler dödsoffer än krigshandlingarna under första världskriget</p>\n<p>- De flesta som blir influensasjuka behöver inte söka läkare, därför vet vi inte hur många i befolkningen som är sjuka.</p>\n<p>För att skydda människor behöver sjukvården och samhället kontinuerligt få en korrekt bild av infektionsläget i befolkningen och snabbt identifiera epidemier. Då kan motåtgärder sättas in, till gagn för alla. Problemet är att sjukvården bara ser toppen av isberget. De flesta infektioner, även influensa, kräver inte sjukvård. Därför kan det dröja ett bra tag innan uppblossande epidemier uppmärksammas. Men om vanliga medborgare hjälps åt och många rapporterar sina infektioner till Influensakoll kan vi skaffa oss ett övertag – en fördel som kan vara livsviktig. Gå med i influensakoll du också, och rapportera eventuella symtom varje vecka så hjälper du till att avslöja influensans spridning. </p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Hur går det till?" id="plugin_obj_34" title="Link - Hur går det till?"/></p><br/>	57
<h1>Hantera flera profiler</h1><p>När du har skapat och aktiverat ett användarkonto ska du skapa minst en profil. Du blir automatiskt ombedd att göra detta när du loggar in första gången. </p><p>Genom att innehavaren av ett användarkonto kan skapa flera profiler ges alla deltagare en möjlighet att rapportera för flera personer samtidigt. Man kan till exempel skapa en profil för ett barn under 15 år som inte får delta själv eller för andra familjemedlemmar som av något skäl inte kan eller vill skapa ett eget användarkonto.  </p><h3>Skapa profiler</h3><p>1. Klicka på "<a href="http://www.influensakoll.se/sv/survey/thanks/">Mitt konto</a>" högst upp i högra hörnet på sidan. </p><p>2. Här får du flera val som rör ditt användarkonto. Klicka på "Lägg till profil". </p><p>3. Skriv ett namn på den profil du vill lägga till och klicka på knappen "Lägg till profilen".</p><p>4. Nu hamnar du på en sida där dina profiler listas. Efter varje profilnamn finns tre länkar till de aktiviteter du kan välja mellan:</p><p><strong>Ändra profilnamn:</strong> Klicka på länken om du vill ändra namn på en profil.</p><p><strong>Uppdatera bakgrundsinformation: </strong>Klicka på länken om du vill fylla i frågeformuläret om profilens bakgrund eller om du vill ändra något i ett redan ifyllt bakgrundsformulär. </p><p><strong>Rapportera:</strong> Klicka på länken om du vill rapportera för profilen. Observera att du måste fylla i ett bakgrundsformulär för profilen innan du kan rapportera.</p><p>5. En gång i veckan får du en påminnelse till den e-postadress som angivits för ditt användarkonto. Om du har flera profiler i användarkontot ska du rapportera för alla profiler varje vecka. </p><p>Har du frågor är du välkommen att <img src="/media/cms/images/plugins/link.png" alt="Länk - kontakta oss" id="plugin_obj_570" title="Länk - kontakta oss"/>.  </p>	548
<br/><br/>	1108
<p style="FONT-STYLE: italic;">Visas inte kartan? Ladda då ner den senaste versionen av webbläsaren Mozilla Firefox genom att klicka på <a href="http://www.mozilla.org/sv-SE/firefox/new/">http://www.mozilla.org/sv-SE/firefox/new/</a>. Programmet är gratis. </p>	1019
<h2>Influensakurer från 1894</h2>\n<p>Så här såg influensakuren ut i Medicinsk Hygien, år 1894. </p>\n<p>Där kan man läsa att, ”En gyllene regel vid hvarje sjukdoms annalkande är att, så snart man känner sig illamående, utan dröjsmål söka komma i svettning… Så snart derföre frossbrytningar eller andra förebådande tecken till sjukdomens utbrott förnimmas, bör man ofördröjligen taga sig ett Svettbad, hvilket går alldeles utmärkt bra för sig i sängen på följande sätt: Fyll 4 halfstopsbuteljer… med kokhett vatten, korka dem väl och stick så in dem i hvar sin i kylslaget vatten blötta och väl urvridna yllestrumpa. Lägg en af dem vi hvardera foten och en vid hvardera benet strax ofvan fotknölen…”</p>\n<p>Klicka på bilden för att se hela texten. </p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - influensagammal_liten.png" id="plugin_obj_905" title="Bild - influensagammal_liten.png"/></p>	898
<p><strong>Instruktioner</strong></p><p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen.</p><p>För information om vad som rapporterats i ett län, dubbelklicka på området.</p>	998
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Gå med i Hälsorapport" id="plugin_obj_730" title="Länk - Gå med i Hälsorapport"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Rapportera" id="plugin_obj_331" title="Link - Rapportera"/></p>	328
<p><em>Obs! I nuläget har inga postnummerområden fler än 10 deltagare, så därför visas endast grön och gul färg på kartorna. </em></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: förkylning" id="plugin_obj_965" title="Länk - Sjukdomsläget: förkylning"/> </p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: magsjuka" id="plugin_obj_964" title="Länk - Sjukdomsläget: magsjuka"/></p>	1062
<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<img src="/media/cms/images/plugins/image.png" alt="Bild - Logotyp" id="plugin_obj_1320" title="Bild - Logotyp"/>	1330
<p><img src="/media/cms/images/plugins/image.png" alt="Bild - snabblank2.PNG" id="plugin_obj_1344" title="Bild - snabblank2.PNG"/><br/><img src="/media/cms/images/plugins/link.png" alt="Länk - Gå med i Hälsorapport" id="plugin_obj_1342" title="Länk - Gå med i Hälsorapport"/><br/><img src="/media/cms/images/plugins/link.png" alt="Länk - Om Hälsorapport" id="plugin_obj_1340" title="Länk - Om Hälsorapport"/><br/><img src="/media/cms/images/plugins/link.png" alt="Länk - Rapportera" id="plugin_obj_1341" title="Länk - Rapportera"/><br/><img src="/media/cms/images/plugins/link.png" alt="Länk - Vår hjälpsida" id="plugin_obj_1345" title="Länk - Vår hjälpsida"/><br/><img src="/media/cms/images/plugins/link.png" alt="Länk - Kontakta oss" id="plugin_obj_1343" title="Länk - Kontakta oss"/></p>	1305
<h2>Veckorapporter</h2>\n<h3>Folkhälsomyndighetens nyhetsbrev</h3>\n<p>Varje torsdag skickar vi ut Folkhälsomyndighetens nyhetsbrev med aktuell information om om folkhälsa, prevention och smittskydd. Tjänsten är kostnadsfri. Klicka <a href="http://www.folkhalsomyndigheten.se/nyheter-och-press/">här för att läsa</a> och <a href="http://www.folkhalsomyndigheten.se/nyheter-och-press/prenumerera/">här för att prenumerera</a> på nyhetsbrevet via e-post.</p>\n<h3>Vinterkräksjukan</h3>\n<p>Folkhälsomyndighetens veckorapport om calicivirusläget i Sverige publiceras varje torsdag mellan vecka 40 och vecka 20. Läs veckans rapport <a href="http://www.folkhalsomyndigheten.se/amnesomraden/statistik-och-undersokningar/sjukdomsstatistik/calicivirus-veckorapporter/ar-2014/">här</a> eller mer om calicivirus i Folkhälsomyndighetens uppslagsverk <a href="http://www.folkhalsomyndigheten.se/amnesomraden/smittskydd-och-sjukdomar/smittsamma-sjukdomar/calicivirus-noro-och-sapovirus/"><em>fakta om smittsamma sjukdomar</em></a>.</p><h3><strong>RS-virus</strong></h3><p>Folkhälsomyndighetens veckorapport om antalet laboratorieverifierade fall av respiratoriskt syncytial virus (RS-virus) i Sverige publiceras varje torsdag mellan vecka 40 och vecka 20. Du kan läsa <a href="http://www.folkhalsomyndigheten.se/amnesomraden/statistik-och-undersokningar/sjukdomsstatistik/rsv-veckorapporter/senaste-rsv-rapporten/">den senaste rapporten här</a>. Läs mer om RS-virus på <a href="http://www.folkhalsomyndigheten.se/amnesomraden/smittskydd-och-sjukdomar/smittsamma-sjukdomar/respiratory-syncytial-virus-rsv/">Folkhälsomyndighetens webbplats.</a> </p>\n<h3>Influensan</h3>\n<p>Veckorapporten om influensaläget i Sverige och Världen publiceras varje torsdag mellan vecka 40 och vecka 20. I den kan du läsa mer om hur många fall som rapporterats runtom i landet från laboratorier och sentinelläkare, samt hur läget ser ut i våra andra alternativa rapporteringsprojekt Webbsök och Vårdguiden 1177. <a href="http://www.folkhalsomyndigheten.se/amnesomraden/statistik-och-undersokningar/sjukdomsstatistik/influensa-veckorapporter/aktuell-influensarapport/">Klicka här</a> för att läsa veckans influensarapport.</p>\n<h3>Webbsök för influensa</h3>\n<p>Genom Webbsök får vi varje vecka uppgifter om antalet sökningar gjorda på influensa och influensasymptom på 1177 Vårdguidens webbplats 1177.se. Dessa matas in i en statistisk modell som uppskattar andelen patienter med influensaliknande sjukdom, vilket är ett av de traditionella influensamåtten. Publiceras varje måndag: <a href="http://www.folkhalsomyndigheten.se/amnesomraden/statistik-och-undersokningar/sjukdomsstatistik/influensa-veckorapporter/webbsok-for-influensa/20132014/">Läs den senaste rapporten</a>.</p>	882
<h1>Pandemier</h1><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_452" title="Länk - Tillbaka till influensaskolan"/></p><p>Med oregelbundna intervaller ändras influensavirus så mycket att en ny sort kan börja spridas effektivt mellan människor runtom i världen. Det kallas pandemi. Här kan du läsa mer om hur en pandemi uppstår. </p><p>När man har haft influensa – eller blivit\nvaccinerad – har kroppens immunförsvar utvecklat antikroppar som snabbt \ndödar\nalla viruspartiklar av samma slag som man redan haft (eller som vaccinet\n varit\nriktat mot). Man är immun. Immuniteten byggs upp eftersom alla influensavirus har höljen (utsidan av\nviruspartiklarna) som immunförsvaret känner igen. </p><p>Olika influensavirus har delvis olika höljen. När man är immun mot en viss subtyp\nkänner immunförsvaret igen virusets hölje och antikropparna är \n“skräddarsydda”\nmot just detta hölje eller snarlika höljen. Immuniteten sitter i under\nåtskilliga år. Har man någon gång i livet haft influensa av en viss \nsubtyp mobiliseras\nförsvaret snabbt om man utsätts för samma smitta igen; de flesta som är \nimmuna blir\növerhuvudtaget inte sjuka medan andra får en mycket mild sjukdom. \nEftersom\ninfluensa är en så smittsam sjukdom finns det väldigt många i \nbefolkningen som\när immuna mot en eller flera subtyper av influensa. Det är bland annat \ndärför som\ninte alla blir sjuka under influensasäsongerna. Och om många i \nbefolkningen är\nimmuna försvåras spridningen i befolkningen. Däremot kan väldigt många bli sjuka om få är immuna. </p><p>Influensa\n finns också hos många andra\ndjurarter. Med oregelbundna intervaller ändras influensavirus från \nandra\ndjurarter så att de kan infektera människor. Det rör \nsig\nhuvudsakligen om influensa från svin men möjligen också från fåglar. Om \nett\nvirus har ett helt nytt hölje kommer i stort sett alla människor i hela \nvärlden\natt vara mottagliga för infektionen eftersom ingen har immunitet mot \ndet. Om\nett sådant nytt virus dessutom kan smitta effektivt mellan människor kan\n en\npandemi uppstå . Då smittas människor världen över med den nya influensan.</p><p><img src="/+media/cms/images/plugins/image.png" alt="Picture - pigs.jpg" id="plugin_obj_453" title="Picture - pigs.jpg"/>\n </p><p>Under 1900-talet hade vi haft tre stora pandemier då \nvirus från\ndjur anpassades till människor. Åtminstone två av de tre, Asiaten (1957)\n och\nHongkong-influensan (1968), uppkom genom att influensavarianter från \nfågel och\nmänniska samtidigt hade infekterat grisar och där blandats till ett nytt\ninfluensavirus. Dessa blandvirus spreds sedan tillbaka till människor \noch gav\nupphov till pandemier. Spanska sjukans influensavirus (1918) uppfattades länge \nsom ett\nvirus som också överförts från gris, men nyare forskning talar för att \ndet\ntroligen kom direkt från fåglar till människa, möjligen efter en kortare\nanpassningsperiod i gris.</p><p>I diagrammet nedan visas antalet fall som sökt läkare för influensa i Sverige under 1900-talet. Där kan man tydligt se de tre pandemierna 1918, 1957, och 1968. </p><p><img src="/+media/cms/images/plugins/image.png" alt="Picture - Pandemier i Sverige 1900-talet" id="plugin_obj_599" title="Picture - Pandemier i Sverige 1900-talet"/></p><p>Anledningen till att ett nytt \ninfluensavirus\nsom smittar mellan människor oftast kommer från grisar är att grisarnas\nimmunsystem och cellfunktioner är mycket lika människans. Samtidigt kan\ngrisarna lättare infekteras av virus från andra djurarter än människan. \nDe är\nalltså ett utmärkt blandningskärl för att skapa virus som kan få \nspridning\nbland människor. Den nya influensan A(H1N1) ("svininfluensan") är just ett sådant virus. Det\nhar gener med ursprung i olika svinvirus, och kanske också från fågel \noch\nmänniska. Det har sannolikt tagit flera år för blandningen att uppstå, \noch vi\nvet inte var det skedde och inte heller var den först nådde människor. \nVid\nupptäckten att av viruset i slutet på april 2009 var stammen redan \nspridd på\nflera ställen i Mexico och USA. Symtomen för den nya influensan liknar dem som\norsakas av den årliga influensan.</p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_454" title="Link - Tillbaka till influensaskolan"/></p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_704" title="Kodstycke - Twitterbutton"/></p>	451
<p><strong>Sveriges smittskyddsenheter</strong></p><p>Till ditt landstings smittskyddsenhet kan du vända dig för att få råd och information om lokala smittskyddsfrågor. </p><p>Hitta din smittskyddsenhet:</p>\n<p><a href="http://www.smittskyddstockholm.se/">Stockholm</a></p>\n<p><a href="http://www.lul.se/default.aspx?id=4241">Uppsala</a> </p>\n<p><a href="http://www.landstingetsormland.se/Startsida/Verksamheter/SmittskyddVardhygien/">Sörmland</a> </p>\n<p><a href="http://www.lio.se/templates/Substart.aspx?id=17457">Östergötland</a></p>\n<p><a href="http://www.lj.se/smittskydd">Jönköping</a></p>\n<p><a href="http://www.ltkronoberg.se/templates/LTKPresentation____2653.aspx">Kronoberg</a></p>\n<p><a href="http://www.ltkalmar.se/lttemplates/SubjectPage____599.aspx">Kalmar</a></p>\n<p><a href="http://www.gotland.se/imcms/29806">Gotland</a></p>\n<p><a href="http://www.ltblekinge.se/smittskyddsenheten">Blekinge</a></p>\n<p><a href="http://www.skane.se/smittskydd">Skåne</a></p>\n<p><a href="http://www.regionhalland.se/smittskydd">Halland</a></p>\n<p><a href="http://www.vgregion.se/smittskydd">Västra Götaland</a></p>\n<p><a href="http://www.smittskyddvarmland.se/">Värmland</a></p>\n<p><a href="http://www.orebroll.se/uso/smittskydd">Örebro</a></p>\n<p><a href="http://www.ltv.se/smittskydd">Västmanland</a></p>\n<p><a href="http://www.ltdalarna.se/smittskydd">Dalarna</a></p>\n<p><a href="http://www.lg.se/smittskydd">Gävleborg</a></p>\n<p><a href="http://www.lvn.se/smittskydd">Västernorrland</a> </p>\n<p><a href="http://www.jll.se/smittskydd">Jämtland</a></p>\n<p><a href="http://www.vll.se/smittskydd">Västerbotten</a></p>\n<p><a href="http://www.nll.se/smittskydd">Norrbotten</a></p>	1313
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: influensa" id="plugin_obj_968" title="Länk - Sjukdomsläget: influensa"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: förkylning" id="plugin_obj_972" title="Länk - Sjukdomsläget: förkylning"/></p>	993
<h1>Kontakta oss</h1><p>Folkhälsomyndigheten är ansvarig för www.halsorapport.se och för den information som Hälsorapports deltagare lämnar. Läs mer om datainsamlingen <img src="/media/cms/images/plugins/link.png" alt="Länk - här" id="plugin_obj_316" title="Länk - här"/>. Om du har frågor eller synpunkter är du välkommen att höra av dig.</p><p>Kontaktperson: Marie Rapp</p><p>E-post: <img src="/media/cms/images/plugins/link.png" alt="Länk - halsorapport@folkhalsomyndigheten.se" id="plugin_obj_315" title="Länk - halsorapport@folkhalsomyndigheten.se"/></p>	314
<h4>Tekniska fel</h4>\n<p>Just nu undersöker vi följande tekniska fel:</p>\n<p>2014-11-10. Vi har problem med uppdatering av Hälsorapports säkerhetscertifikat. Om du går till Hälsorapports webbplats får du förmodligen ett felmeddelande. Du kan ignorera felmeddelandet och på ett säkert sätt klicka dig vidare och rapportera som vanligt. Veckans nyhetsbrev skickas ut senare under dagen.</p>\n<p>2014-07-08. Den 23-24 juni hade vi problem med mejlen. Om du försökte kontakta oss då och inte har fått något svar ber vi dig mejla oss på nytt. </p><p>2014-05-02. I början på vecka 18 hade Hälsorapport nätverksproblem vilket kan ha försvårat rapporteringen. Problemet ska nu vara löst. </p><p>2014-03-14. Allt tyder på att vi har hittat en lösning på problemet som några deltagare har haft med rapporteringslänken.</p><p>2014-02-28. Några deltagare har haft problem med rapporteringslänken i nyhetsbrevet. Vi jobbar på att lösa problemet.  </p><p>2014-02-13. Vi har nu åtgärdat problemet som gjorde att några deltagare inte fått påminnelsemejl under ett par veckor. Denna veckas utskick bör därför ha nått alla deltagare. </p><p>2014-02-06. Vi har nu upptäckt att en del deltagare inte fått några påminnelsemejl under de senaste två-tre veckorna. Vi jobbar på att få igång mejlen till samtliga deltagare. </p><p>2014-01-23. Hälsorapport är åter igång efter omfattande tekniska problem. Nyhetsbrevet för vecka 3 gick ut cirka 17 den 23:e januari. Webbplatsen låg nere i cirka 24 timmar från tisdag eftermiddag till onsdag eftermiddag. Orsaken var övergången till den nya Folkhälsomyndighetens servrar. </p><p>2013-12-09. På grund av uppdateringen den 5 dec 2013 kan enkäterna se konstiga ut, till exempel att de inte syns alls eller att fritextfält ser tomma ut om du går in för att ändra en befintlig enkät (till exempel din senaste rapport). Om detta händer dig, tryck ner Ctrl och F5 knapparna på ditt tangentbord samtidigt. Felet beror på att webbläsaren sparar gamla formatfiler istället för att ladda om nya. En bättre lösning är på gång. </p><p>2013-11-19. Webbplatsen laddas långsamt. Vi har hittat orsaken till detta och förbättrat det i den mån det går i nuläget. Vi hoppas kunna snabba på sidan ännu mer inom kommande veckor.</p><p>- <strong>"Koden XX är redan upptagen". </strong>Detta fel är nu åtgärdat. Om du fått detta meddelande när du matat in din kod och ditt födelsedatum så är du inte ensam. Testa att klicka på "Mitt konto" längst upp till höger på sidan. Kommer du dit så har din kod och födelsedatumet registrerats korrekt. (Alltså är det "upptaget" av dig.) </p>	872
<h2>Sjukdomsläget: influensa</h2>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Klicka här" id="plugin_obj_1063" title="Länk - Klicka här"/> för att komma till kartan över rapporterad influensa.</p>\n<h2>Sjukdomsläget: förkylning</h2>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Klicka här" id="plugin_obj_1064" title="Länk - Klicka här"/> för att komma till kartan över rapporterad förkylning.</p>	1020
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_479" title="Link - Tillbaka till startsidan"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Läs mer om Influensakoll" id="plugin_obj_370" title="Link - Läs mer om Influensakoll"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Influensakola" id="plugin_obj_367" title="Link - Influensakola"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_368" title="Link - Frågor och svar"/></p>	1116
<p><strong>Visas inte kartan? Ladda då ner den senaste versionen av webbläsaren Mozilla Firefox genom att klicka på </strong><a href="http://www.mozilla.org/sv-SE/firefox/new/"><strong>http://www.mozilla.org/sv-SE/firefox/new/</strong></a><strong>. Programmet är gratis. <em>Vi jobbar på att få kartan att visas i alla webbläsare.</em></strong></p>\n<p>Kartan visar de postnummerområden i Sverige där deltagare har rapporterat symptom på influensa de senaste 7 dagarna (rullande). Kartan ritas automatiskt om varje dag och bygger på de rapporter som kommer in från deltagarna runt om i landet. </p>\n<p>På influensakartan kan du se i gult de områden där mellan 1 och 10 deltagare rapporterat influensaliknande symptom, i orange de områden där mellan 11 och 30 deltagare rapporterat influensaliknande symptom, och i rött de områden där över 30 deltagare rapporterat influensaliknande symptom. Gröna områden visar de postnummerområden där deltagare inte rapporterat några symptom.</p>\n<p>Hur tillförlitlig kartan är beror helt på hur många deltagare vi har. Just nu är färgerna på kartan baserade på relativt få deltagare. Så sprid gärna <a href="http://www.influensakoll.se/">www.influensakoll.se</a> vidare till dina vänner och bekanta!</p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p>	887
<h1>Sjukdomsläget: förkylning</h1>\n<p>Här visas en karta som visar sjukdomsläget på länsnivå. Kartan visar län där deltagare under de senaste sju dagarna rapporterat symptom som tyder på <strong><em>förkylning. </em></strong>Färgerna visar vilken andelen av rapporterna som inkommit under de senaste 7 dagarna som tyder på förkylning. Till vänster visas en förklaring av färgerna. </p>	999
<h1>Influensaskola</h1><p><strong>På den här sidan kan du lära dig om\nluftvägsinfektioner, influensa, vaccin, influensaövervakning och hur du\nundviker att bli smittad.</strong></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Influensa" id="plugin_obj_416" title="Link - Influensa"/></h3><p>Influensa är en virussjukdom. Det finns tre typer av \ninfluensavirus:\ninfluensa A, B och C, som alla tillhör gruppen ortomyxovirus. Det är \nfrämst A\noch B som ger upphov till den typiska influensasjukdomen. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_418" title="Link - Läs mer..."/></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Förkylning" id="plugin_obj_434" title="Link - Förkylning"/></h3><p>Förkylning\när en av de allra vanligaste infektionssjukdomarna och drabbar vuxna \npersoner i\ngenomsnitt en till två gånger per år. En förkylning är nästan alltid orsakat av ett virus och är mycket smittsam. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_435" title="Link - Läs mer..."/></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Pandemier" id="plugin_obj_438" title="Link - Pandemier"/></h3><p>Med\noregelbundna intervaller anpassas influensavirus från andra djurarter \ntill att\ninfektera de övre luftvägarna hos människor. Om det blir spridning mellan människor kan en pandemi uppstå. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_439" title="Link - Läs mer..."/></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Så mäts influensaaktiviteten i Sverige" id="plugin_obj_440" title="Link - Så mäts influensaaktiviteten i Sverige"/></h3><p>För\natt bedöma det aktuella influensaläget och förutsäga utvecklingen av en \nepidemi\nanvänder Smittskyddsinstitutet olika rapporteringssystem, inklusive Influensakoll. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_441" title="Link - Läs mer..."/></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Så sprids influensavirus" id="plugin_obj_442" title="Link - Så sprids influensavirus"/></h3><p>Influensasmittan finns hos den sjuke i näsa och hals/svalg och sprids till\n andra främst genom små partiklar som bär viruset i luften (aerosol). <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_443" title="Link - Läs mer..."/></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Så undviker du att bli smittad" id="plugin_obj_444" title="Link - Så undviker du att bli smittad"/></h3><p>Det är viktigt att den som är sjuk inte hostar och\nnyser rakt ut. Gör till en vana att alltid hosta och nysa i armvecket \noch\nanvända pappersnäsdukar som sedan slängs i en soppåse. Handtvätt med \ntvål och vatten kan minska risken\natt en sjuk sprider smitta och att en frisk smittas. Komplettera gärna \nmed\nhandsprit. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_445" title="Link - Läs mer..."/></p><h3><img src="/+media/cms/images/plugins/link.png" alt="Link - Influensavaccination" id="plugin_obj_446" title="Link - Influensavaccination"/></h3><p>Man\nkan vaccinera sig mot influensa. Vaccinet ska tas i god tid före en \nkommande\ninfluensasäsong, för vaccinets sammansättning är anpassad till de virusstammar, i\n regel\ntre, som förväntas dyka upp under den kommande influensasäsongen. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer..." id="plugin_obj_447" title="Link - Läs mer..."/></p>	406
<h1>Influensavaccination</h1><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_468" title="Länk - Tillbaka till influensaskolan"/></p><p>Man kan\nvaccinera sig mot influensa. Vaccinet\nrekommenderas i första hand till personer som av medicinska orsaker kan \ndrabbas\nextra svårt av sjukdomen (se nedan) \noch bör\nockså ges till alla över 65 år. Vaccinet bör tas i god tid före den kommande \ninfluensasäsongen och är en sammansättning av de virusstammar, i\n regel\ntre, som förväntas dyka upp under den kommande säsongen. Hos dem som ändå insjuknar blir symtomen\nlindrigare och komplikationerna färre om de vaccinerats. Under Pandemin\n2009 erbjöds vaccin till hela Sveriges befolkning mot influensa A(H1N1) ("svininfluensan"). De som hör till en\nriskgrupp för svår influensasjukdom bör låta sig vaccineras varje år. </p><p><strong>Du\n kan delta i\nInfluensakoll oavsett om du vaccinerar dig eller inte.</strong></p><p>Enligt Socialstyrelsens allmänna råd avseende \nsäsongsinfluensavaccination kan vaccination vara av värde för följande \ngrupper:</p><p>- Patienter med kronisk hjärt- och/eller lungsjukdom, i synnerhet de \nmed hjärtsvikt och nedsatt lungfunktion.</p><p>- Personer över 65 års ålder. Indikationen ökar med stigande ålder och\n vid underliggande kronisk sjukdom.</p><p>- Även patienter med andra kroniska sjukdomar som diabetes mellitus \neller gravt nedsatt immunförsvar (av sjukdom eller medicinering) kan \nrekommenderas vaccination mot influensa, men värdet av vaccinationen är \nej lika väl dokumenterat som för de ovan nämnda grupperna. </p><p>- Gravid kvinnor som inte vaccinerats med pandemivaccinet (Pandemrix(R)) under 2009 eller 2010. </p><p>All vaccination är frivillig och görs efter individuellt \nställningstagande.</p><p>Källa: Socialstyrelsen SOSFS 1997:2.</p><h2><span lang="NL">Varför kommer det ett nytt vaccin varje år?</span></h2><p><span lang="NL">Det finns flera olika\nstammar av influensaviruset. Dessa stammar brukar genomgå små \nförändringar från\når till år. Ju större förändringar, desto sämre skydd har man av gamla\nvaccinationer eller tidigare genomgången influensa. Därför behöver ett \nnytt\nvaccin framställas varje år. Det är inte en helt enkel uppgift att \nbestämma\nvilka stammar som det nya vaccinet skall skydda emot. Vaccinstammarna \nväljs med\nstor noggrannhet, och i de flesta fall ger det ett bra skydd. För att \nman ska\nhinna producera de vaccindoser som behövs måste man börja sex månader \nföre\nvaccinstarten. Har man riktig otur kommer det fram ett nytt virus efter \ndet att\nman valt, och då blir vaccinationseffekten sämre.</span></p><h2><strong>Säsongens influensavaccin</strong></h2><p><span lang="NL">Beslutet om vilka stammar som ska vara med i vaccinet\n för\nkommande säsong fattats vid ett stort årligt expertmöte vid\nVärldshälsoorganisationen, WHO. Där går man igenom alla influensastammar\n som\nskickats till WHO-laboratorier för att hitta dem som har potential att \nskapa\nepidemi nästa säsong. Influensavirus får namn efter den plats där det \nhittats.\nMan kan skilja dem åt genom att de har olika nummer och olika\nsubtypsbeteckningar.  </span><span lang="NL"/><span lang="NL"/></p><p><span lang="NL">Influensavaccinet\nför säsongen 2011/2012 innehåller:</span><span lang="NL"/></p><p><span lang="NL">- A/California/7/2009\n (H1N1)-liknande virus;</span><span lang="NL"/></p><p><span lang="NL">- A/Perth/16/2009 (H3N2)-liknande virus;</span></p><p>- B/Brisbane/60/2008-liknande virus. <strong><span lang="NL"/></strong></p><p>Läs mer\n på WHO:s <img src="/media/cms/images/plugins/link.png" alt="Länk - hemsida" id="plugin_obj_470" title="Länk - hemsida"/>. Sidan är på engelska<strong>.</strong></p><p><strong><strong><strong><img src="/+media/cms/images/plugins/image.png" alt="Picture - _injection_needle_small.jpg" id="plugin_obj_469" title="Picture - _injection_needle_small.jpg"/></strong><strong/></strong></strong></p><h2><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong>Så tar man fram \ninfluensavaccin</strong><span lang="NL"/></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></h2><p><strong><strong><strong><strong><strong><strong><strong><strong><span lang="NL">För \natt odla virus krävs celler\nsom viruset kan växa i. Befruktade hönsägg är bra att odla \ninfluensavirus i för\natt det ger stora mängder virus, vilket man behöver för att kunna \nproducera\nvaccin. När viruset växt till sig i äggen sugs vätskan ur äggen, virus dödas\nså att det inte kan smitta och sedan renar man fram virusets yta. </span></strong></strong></strong></strong></strong></strong></strong></strong></p><p><strong><strong><strong><strong><strong><strong><strong><strong><strong><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_471" title="Link - Tillbaka till influensaskolan"/></strong></strong></strong></strong></strong></strong></strong></strong></strong></p><p><strong><strong><strong><strong><strong><strong><strong><strong><strong><strong><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_708" title="Kodstycke - Twitterbutton"/></strong></strong></strong></strong></strong></strong></strong></strong></strong></strong></p>	467
<p><img src="/+media/cms/images/plugins/image.png" alt="Picture - ANNIKA-LINDE-.jpg" id="plugin_obj_506" title="Picture - ANNIKA-LINDE-.jpg"/> </p><p>Annika Linde berättar om Influensa. <img src="/media/cms/images/plugins/link.png" alt="Länk - Se filmen här." id="plugin_obj_410" title="Länk - Se filmen här."/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Frågor och svar" id="plugin_obj_767" title="Länk - Frågor och svar"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_411" title="Link - Tillbaka till startsidan"/></p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_709" title="Kodstycke - Twitterbutton"/></p>	407
<p><em><a href="https://www.halsorapport.se/sv/nyhetsarkiv">Till vårt nyhetsarkiv...</a> </em></p>	1178
<h1>Länkar</h1>\n<p>Nedan kan du hitta mer information om projektet, influensa och andra relaterade ämnen, samt smittskyddsenheten i ditt landsting.</p>	858
<p>Tack för att du tog dig tid att fylla i enkäten.</p><p>Klicka på "<img src="/media/cms/images/plugins/link.png" alt="Länk - &quot;mitt konto&quot;" id="plugin_obj_682" title="Länk - &quot;mitt konto&quot;"/>" för att se en sammanfattning av de uppgifter som du angett för dina profiler. Där kan du lägga till eller rapportera för  en annan profil (läs mer om att hantera flera profiler <img src="/media/cms/images/plugins/link.png" alt="Länk - här" id="plugin_obj_680" title="Länk - här"/>). </p>	679
<h1>Så mäts influensaaktiviteten i Sverige</h1><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_456" title="Länk - Tillbaka till influensaskolan"/></p><p>Influensa är en allvarlig infektion som kan påverka\n den enskilde,\nsjukvården och samhället. För att bedöma det aktuella influensaläget och\nförutsäga utvecklingen av en epidemi använder SMI olika \nrapporteringssystem. En\ndel av dessa ingår i rutinövervakning och är likartade världen över. De\n bygger\nalla på rapportering från sjukvården och på att patienter sökt läkare. De är de vi beskriver nedan under <em>Rutinmässiga system</em>. </p><p>De flesta influensasjuka behöver dock inte gå till läkare. Därför kan en\nepidemi byggas upp under ganska lång tid innan det blir uppenbart att en\n ny\ninfluensa är på gång. För att förstå hur många som egentligen är sjuka \nprövar\nvi därför andra rapporteringssystem. De är dessa vi beskriver nedan under <em>Övervakningssystem under utprövning</em>. </p><h2><strong>Rutinmässiga\nsystem</strong></h2><p><strong>Sentinelövervakning</strong>. Sentinelövervakning\n (från engelskans <em>sentinel</em>, som betyder spejare) genomförs av \nungefär 100\nfrivilliga öppenvårdsläkare. De är utspridda över hela Sverige och \nrapporterar varje\nvecka hur många patienter med influensaliknande symtom ("ILI") som de \nbehandlat\nunder veckan. De rapporterar också hur\nmånga patienter totalt (oavsett diagnos) som de behandlat under veckan. \nSentinelövervakningen\nvisar alltså hur många procent av sentinelläkarnas patienter som har\ninfluensaliknande sjukdom. Detta övervakningssystem ger en hygglig \nupfattning\nom när den årliga influensaepidemin börjar ta fart och när epidemin \nkulminerar. Svagheten är\natt det bara är personer som söker sjukvården som räknas. Eftersom\nsentinelläkarnas patienter inte är representativa för hela befolkningen \när det\nockså svårt att översätta sentinelövervakningens information till \nsjuktal för\nhela befolkningen. När man försöker uppskatta de sjuktalen har \nundersökningar\nvisat att antalet personer med influensaliknande sjukdom i befolkningen \nkan\nvara upp till 100-faldigt högre än de uppskattningar som man får fram \nbaserade\npå sentinelövervakningen. Men eftersom felet är ungefär detsamma varje \når kan\nman ändå ganska väl avgöra om det är en stor eller liten epidemi.  </p><p><strong>Sentinelprovtagning. </strong>Vissa\n utvalda \nsentinelläkare tar\nockså rutinmässigt näsprover för virusdiagnostik från sina patienter med\nmisstänkt influensa. Dessa prover analyseras av Smittskyddsinstitutet. Sentinelprovtagning\n visar hur stor andel av\npatienterna med inflensaliknande symtom som verkligen har influensa.</p><p><strong>Anmälningsplikt.</strong> Till \nskillnad från den vanliga\nsäsongsinfluensan omfattas den nya influensan A (H1N1) ("svininfluensan") av \nsmittskyddslagen och\när anmälningspliktig. Det åligger läkare att anmäla fall av den nya \ninfluensan\ntill Smittskyddsinstitutet. Anmälningarna sker via det internetbaserade\ninrapporteringssystemet SmiNet. Det är bara bekräftade fall av den nya \ninfluensan\nsom blir anmälda. Anmälningarna som inkommer på grund av anmälningsplikten\n visar\ndärför hur många av de som genomgått virusprovtagning som är smittade av\n den\nnya influensan. Viruslaboratorierna\nrapporterar även frivilligt antalet säsongsinfluensadiagnoser\nsom ställts inom ramen för rutindiagnostiken. </p><h2><strong>Övervakningssystem under utprövnin</strong>g</h2><p><strong>Sjukrapport</strong>\n är ett befolkningsbaserat rapporteringssystem som\nutvecklats för att råda bot på sentinelövervakningens svagheter. De\nsom rapporterar om förekomst av influensaliknande sjukdom och andra \nakuta övre\nluftvägsinfektioner är allmänheten, inte läkarna. <em>Sjukrapport </em>har sedan \nnågra\når pågått i Stockholm. Den största fördelen med <em>Sjukrapport </em>är att \ndeltagarna\nutgörs av ett slumpvis och därmed representativt urval av befolkningen. \nDe är\nmed under en hel säsong och rapporterar via webben eller automatisk\ntalsvarstelefon så fort de blir sjuka. När deltagarna rapporterar \nsjukdom\nbesvarar de ett antal frågor om sina symtom. Med hjälp av den \ninformationen kan\nsjukfallen delas upp i influensaliknande sjukdom och övre \nluftvägsinfektioner\nav annat slag. I och med att deltagarna utgörs av ett representativt \nurval kan\ninformationen generaliseras till hela befolkningen, och giltig \ninformation om\nsjuktalen i olika undergrupper av befolkningen (åldersgrupper, \nmän/kvinnor, bostadsorter)\nkan beräknas. Eftersom deltagarna rapporterar så fort de blir sjuka får \nman\ninformation om sjukligheten i realtid, något som kan vara av avgörande\nbetydelse när en allvarlig epidemi hotar. Svagheten med <em>Sjukrapport </em>är \natt\nmånga inbjudna inte medverkar, vilket leder till frågetecken om\nrepresentativiteten. Även de som deltar kan missa att rapportera när de \nblir\nsjuka, vilket kan leda till en underskattning av sjukligheten. Det har också\nvisat sig att sjuktalen från <em>Sjukrapport </em>är 10 till 100 gånger högre än de \nsjuktal\nsom uppskattas från sentinelövervakningen. På grund av att\n<em>Sjukrapport </em>är mycket resurskrävande har systemet ännu inte kunnat\nimplementeras i hela landet.</p><p><strong>Influensakoll</strong>\n kan\nbeskrivas som en något enklare variant av <em>Sjukrapport</em>. I\nstället för att dra ett slumpvis urval av befolkningen bygger \nInfluensakoll på\natt deltagarna frivilligt anmäler sig. Rapporteringen sker veckovis och\nuteslutande via webben. Deltagarna får varje vecka ett e-postmeddelande \nmed en\nlänk till den lösenordsskyddade personliga rapporteringssidan. Där ska\ndeltagarna rapportera vare sig de är friska eller sjuka. Liksom i <em>\nSjukrapport\n</em>får deltagarna som är sjuka ett antal frågor om sina symptom, och genom svaren kan sjukfallen delas upp i influensaliknande sjukdom och övre\nluftvägsinfektion av annat slag. Eftersom Influensakoll är mindre\nresurskrävande än <em>Sjukrapport </em>kan hela Sverige täckas. Influensakoll är \ndel av <img src="/+media/cms/images/plugins/link.png" alt="Link - Influenzanet" id="plugin_obj_600" title="Link - Influenzanet"/>, med snarlika övervakningssystem i Holland, Belgien,\n Italien, Storbritannien och Portugal. Flera andra europeiska länder \nstår på tur att\ninföra Influensakoll-liknande system. Svagheten är att det kan vara \nsvårt att\ngeneralisera Influensakolls sjuktal till den allmänna befolkningen. Det har en tendens att bli en samling personer som redan är\nsjuka när de går med som influensarapportörer i Influensakoll. Det är \nganska\nnaturligt eftersom det ofta är först då som man kommer i kontakt med webbplatsen.\nDetta leder till en överskattning av sjukligheten bland dem som är \nalldeles nya\ninfluensarapportörer. Den mest tillförlitliga uppskattningen av \nsjukligheten\nkommer från dem som varit rapportörer under minst 6 veckor i rad.</p><p><strong>Webbsök</strong> är\nett mer indirekt sätt att uppskatta förekomsten  av influensa i \nbefolkningen. Det är ett\nautomatiserat Internetbaserat verktyg som finns på \nSmittskyddsinstitutet. Som\ndu säkert känner till är Vårdguiden en populär hemsida där allmänheten \nkan få\nmedicinsk information och råd om vad man ska göra vid en rad \nsjukdomstillstånd.\nVårdguiden förser kontinuerligt Webbsök med information om antalet \nsökningar med\nolika varianter av influensarelaterade sökbegrepp. Undersökningar har \nvisat att\nWebbsök\nförvånansvärt väl förutser utvecklingen av sentinel- och anmälningsdata.\n </p><p>Google har ett liknande system för \ninfluensasökningar gjorda på\nGoogle, <img src="/+media/cms/images/plugins/link.png" alt="Link - Google flu trends" id="plugin_obj_457" title="Link - Google flu trends"/>.</p><p><br/><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_458" title="Link - Tillbaka till influensaskolan"/></p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_705" title="Kodstycke - Twitterbutton"/></p>	455
<h2>Nyhetsarkiv</h2><p>Här lagrar vi alla nyheter som presenterats på Hälsorapports webbplats från och med starten november 2013.</p>	1353
<h1>Så undviker du att bli smittad</h1><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_464" title="Länk - Tillbaka till influensaskolan"/></p><p>Det är\nviktigt att den som är sjuk inte hostar och nyser rakt ut. Gör till en \nvana att\nalltid hosta och nysa i armvecket och använda pappersnäsdukar som sedan \nslängs i\nen soppåse. Handtvätt med tvål och\nvatten kan minska risken att en sjuk sprider smitta och att en frisk \nsmittas. Komplettera\ngärna med handsprit. Hur vet man att man\ntvättat händerna tillräckligt länge? Ett tips är att tyst för sig själv \nsjunga\n”Blinka lilla stjärna”. En vers tar cirka 20 sekunder vilket är \ntillräckligt\nlänge. </p><p>Om en person med misstänkt influensa måste träffa\nandra är det bra att hålla så stort avstånd som möjligt och att inte ta i\n hand\neller kyssa på kind.  Friska personer bör\nom möjligt undvika närkontakt med misstänkta influensasjuka. Friska \npersoner\nbör undvika att röra vid ögon, näsa och mun eftersom influensavirus kan \nha\nfastnat på ett föremål som de nyligen rört vid.</p><p><br/><img src="/+media/cms/images/plugins/image.png" alt="Picture - washing_hands_.jpg" id="plugin_obj_465" title="Picture - washing_hands_.jpg"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_466" title="Link - Tillbaka till influensaskolan"/></p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_707" title="Kodstycke - Twitterbutton"/></p>	463
<h2>Projektet Influensakoll</h2>\n<h3>EPIWORK</h3>\n<p>EU-projektet EPIWORK startade 2009 och finansieras av EU:s sjunde ramprogram (FP7). Influensakoll bedrivs som en del av detta projekt. Läs mer på projektets <a href="http://www.epiwork.eu/">hemsida</a>.</p>\n<h3>Influenzanet</h3>\n<p>Influensakoll är den svenska komponenten i ett Europeiskt system som kallas Influenzanet. Läs mer på projektens gemensamma <a href="http://www.influenzanet.eu/">projektwebbplats</a>.</p>\n<h3>Karolinska Institutet</h3>\n<p>Influensakoll drivs av Karolinska Institutet och Smittskyddsinstitutet. Här kan du besöka Karolinska Institutets <a href="http://www.ki.se/">hemsida</a>.</p>\n<h3>Smittskyddsinstitutet</h3>\n<p>Influensakoll drivs av Karolinska institutet och Smittskyddsinstitutet. Här kan du besöka Smittskyddsinstitutets <a href="http://www.smittskyddsinstitutet.se/">hemsida</a>. </p>	859
<h1>Så sprids\ninfluensavirus</h1><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_460" title="Länk - Tillbaka till influensaskolan"/></p><p>Influensavirus\när\n ett luftburet virus som orsakar infektion i luftvägarna. Smittämnet\nfinns hos den sjuke i näsa och hals/svalg och sprids till andra främst genom små\npartiklar som bär viruset i luften (aerosol), saliv- eller sekretdroppar eller\nkroppskontakt. Viruset tar sig in i luftvägarna när man andas in. Från\ndet att man blir smittat tar det 1-3 dygn innan man blir sjuk (detta kallas inkubationstiden). Smittsamheten\när mycket stor. </p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Titta på en nysning i slowmotion" id="plugin_obj_462" title="Link - Titta på en nysning i slowmotion"/> (extern länk)</p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_461" title="Link - Tillbaka till influensaskolan"/></p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_706" title="Kodstycke - Twitterbutton"/></p>	459
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Jag vill gå med i Influensakoll" id="plugin_obj_729" title="Länk - Jag vill gå med i Influensakoll"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Rapportera" id="plugin_obj_415" title="Link - Rapportera"/></p>	412
<p>{{ unsubscribe_url }} </p>\n<p>test</p>	888
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_1317" title="Länk - Tillbaka till startsidan"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Om Hälsorapport" id="plugin_obj_1318" title="Länk - Om Hälsorapport"/></p>	1316
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om Influensakoll" id="plugin_obj_1188" title="Länk - Om Influensakoll"/></p>\n<blockquote>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om EPIWORK" id="plugin_obj_1190" title="Länk - Om EPIWORK"/></p>\n<p><a href="https://www.influensakoll.se/sv/om-influensakoll/sasongen11-12/">Influensakolldeltagandet 2011-12</a></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Utvärderingsenkäten 2011-12 " id="plugin_obj_1214" title="Länk - Utvärderingsenkäten 2011-12 "/></p></blockquote>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen" id="plugin_obj_1193" title="Länk - Fakta om datainsamlingen"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Jag vill vara med" id="plugin_obj_327" title="Link - Jag vill vara med"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>	1187
<h3><strong>Förklaring</strong></h3><p>Färgskalan nedan visar andelen av rapporterna som tyder på förkylning. </p>	1254
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="http://www.halsorapport.se/media/cms/images/plugins/link.png" alt="Länk - Läs mer om magsjuka" id="plugin_obj_1322" title="Länk - Läs mer om magsjuka"/></p>\n<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Läs mer om influensa" id="plugin_obj_1323" title="Länk - Läs mer om influensa"/></p>	1368
<p><a href="https://www.influensakoll.se/sv/accounts/register/">Gå med i Influensakoll</a> </p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Rapportera" id="plugin_obj_274" title="Länk - Rapportera"/></p>	272
<p><img src="/+media/cms/images/plugins/snippet.png" alt="Snippet - länk till &quot;gå med&quot; G" title="Snippet - länk till &quot;gå med&quot; G" id="plugin_obj_475" /></p><p><img src="../../../images/plugins/link.png" alt="Link - Rapportera" title="Link - Rapportera" id="plugin_obj_476" /></p>	474
<h2>Du är inloggad</h2><h3>1. Skapa din profil</h3><p>Om det är första gången du loggar in på ditt användarkonto behöver du skapa din profil och fylla i ett frågeformulär om din bakgrund. Klicka på länken för att <img src="../../../images/plugins/snippet.png" alt="Snippet - link till Profil" title="Snippet - link till Profil" id="plugin_obj_569" />. Först när du fyllt i bakgrundsinformationen kan du rapportera sjukdom.</p><p>Du kan skapa flera profiler inom samma användarkonto, till exempel\r\n om du vill rapportera för ditt barn. <img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer." title="Link - Läs mer." id="plugin_obj_547" /></p><h3>2. Rapportera till Influensakoll</h3><p>Om du redan har en profil (eller flera) och fyllt i bakgrundsinformationen kan du <img src="/+media/cms/images/plugins/link.png" alt="Link - rapportera" title="Link - rapportera" id="plugin_obj_543" /> direkt. Vi hoppas att du kan rapportera varje vecka för varje profil, oavsett om du är frisk eller sjuk.</p><p><img src="../../../images/plugins/link.png" alt="Link - Gå till startsidan" title="Link - Gå till startsidan" id="plugin_obj_544" /></p>	541
<p><strong>Instruktioner</strong></p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p><p>För information om vad som rapporterats i ett län, dubbelklicka på området. </p><p>Du kan även se antal deltagare och antal rapporter som inkommit under de senaste 7 dagarna när du dubbelklickar på ett län. </p>	513
<p>Klicka på bilden nedan för att höra Annika Linde berätta om influensan i Sverige. </p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - filmlong" id="plugin_obj_627" title="Kodstycke - filmlong"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_538" title="Link - Tillbaka till influensaskolan"/></p>	510
<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<p><img src="/media/cms/images/plugins/image.png" alt="Bild - Logotyp" id="plugin_obj_1320" title="Bild - Logotyp"/></p>	1328
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_479" title="Link - Tillbaka till startsidan"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Läs mer om Influensakoll" id="plugin_obj_370" title="Link - Läs mer om Influensakoll"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Influensakola" id="plugin_obj_367" title="Link - Influensakola"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_368" title="Link - Frågor och svar"/></p>	1085
<h1>Sjukdomsläget: magsjuka</h1>\n<p>Kartan visar postnummerområden där deltagare under de senaste sju dagarna rapporterat symptom som tyder på <em><strong>magsjuka. </strong>Eftersom Influensakolls fokus inte ligger på magsjuka så kan denna karta vara missvisande. </em></p>	994
<h2>Smittskyddsenheterna</h2>\n<p>Landstingens smittskyddsenheter är den myndighet allmänheten ska vända sig till för att få råd och information i smittskyddsfrågor. Landstingens smittskyddsenheter ansvarar för att förebygga och minska spridningen av smittsamma sjukdomar inom det egna landstinget. Arbetet sker genom epidemiologisk övervakning, smittspårning, information och utbildning. Nedan hittar ni länkar till alla smittskyddsenheterna i Sverige.</p>\n<p><a href="http://www.smittskyddstockholm.se/">Stockholm</a></p>\n<p><a href="http://www.lul.se/default.aspx?id=4241">Uppsala</a> </p>\n<p><a href="http://www.landstingetsormland.se/Startsida/Verksamheter/SmittskyddVardhygien/">Sörmland</a> </p>\n<p><a href="http://www.lio.se/templates/Substart.aspx?id=17457">Östergötland</a></p>\n<p><a href="http://www.lj.se/smittskydd">Jönköping</a></p>\n<p><a href="http://www.ltkronoberg.se/templates/LTKPresentation____2653.aspx">Kronoberg</a></p>\n<p><a href="http://www.ltkalmar.se/lttemplates/SubjectPage____599.aspx">Kalmar</a></p>\n<p><a href="http://www.gotland.se/imcms/29806">Gotland</a></p>\n<p><a href="http://www.ltblekinge.se/smittskyddsenheten">Blekinge</a></p>\n<p><a href="http://www.skane.se/smittskydd">Skåne</a></p>\n<p><a href="http://www.regionhalland.se/smittskydd">Halland</a></p>\n<p><a href="http://www.vgregion.se/smittskydd">Västra Götaland</a></p>\n<p><a href="http://www.smittskyddvarmland.se/">Värmland</a></p>\n<p><a href="http://www.orebroll.se/uso/smittskydd">Örebro</a></p>\n<p><a href="http://www.ltv.se/smittskydd">Västmanland</a></p>\n<p><a href="http://www.ltdalarna.se/smittskydd">Dalarna</a></p>\n<p><a href="http://www.lg.se/smittskydd">Gävleborg</a></p>\n<p><a href="http://www.lvn.se/smittskydd">Västernorrland</a> </p>\n<p><a href="http://www.jll.se/smittskydd">Jämtland</a></p>\n<p><a href="http://www.vll.se/smittskydd">Västerbotten</a></p>\n<p><a href="http://www.nll.se/smittskydd">Norrbotten</a></p>	856
<h1>Resultat</h1><p>I Hälsorapport\nrapporterar slumpvis utvalda svenskar om de blivit sjuka under veckan som\nvarit. Baserat på symptomen de anger kan vi veckovis uppskatta andelen personer\ni Sverige som har insjuknat i akut luftvägsinfektion, influensaliknande sjukdom\noch magsjuka. Här nedanför kan du se den senaste veckans resultat från\nHälsorapport.</p><p>De siffror som finns i\nveckorapporten är preliminära och kan alltså komma att ändras framöver.</p><h2>Veckorapport - vecka 47</h2><h3>Hälsorapports veckodiagram</h3><p>Nedan visas två diagram baserade\npå rapporteringen från och med kalendervecka 48, 2013, och framåt. Data har\nviktats på ålder för att spegla Sveriges befolkning. </p><h4>Luftvägsinfektion och influensaliknande sjukdom</h4><p>I diagrammet nedan visas\nden kumulativa incidensen veckovis för luftvägsinfektion och influensaliknande\nsjukdom. Något förenklat kan man säga att diagrammet visar för varje vecka andelen\n(procenten) av Sveriges befolkning som insjuknat i:</p><p><strong>Luftvägsinfektion</strong> (blå linje)</p><p><strong>Influensaliknande sjukdom </strong>(orange linje)</p><p>Diagrammet visar en\npreliminär uppskattning. </p><p><img src="/media/cms/images/plugins/image.png" alt="Bild - ariili_2014_vecka46.png" id="plugin_obj_1384" title="Bild - ariili_2014_vecka46.png"/></p><p>Utförligare\nförklaring av diagrammet: </p><p>Baserat på Hälsorapports\ndata visar ovanstående diagram den kumulativa incidensen av luftvägsinfektioner\noch influensaliknande sjukdom veckovis över tid. Blå linje visar andelen\n(procenten) av Sveriges befolkning som blivit sjuka i luftvägsinfektioner per\nvecka. Orange linje visar andelen (procenten) av Sveriges befolkning som\ninsjuknat med influensaliknande sjukdom per vecka. I vänstra kanten av\ndiagrammet syns skalan för den kumulativa incidensen veckovis. I den nedre kanten\nsyns kalenderveckorna. </p><h4>Magsjuka</h4><p>I diagrammet nedan visas\nden kumulativa incidensen veckovis för magsjuka. Något förenklat kan man säga\natt diagrammet visar för varje vecka andelen (procenten) av Sveriges befolkning\nsom insjuknat i:</p><p><strong>Magsjuka </strong>(grå linje)\n\n</p><p>Diagrammet visar en\npreliminär uppskattning. </p><p><img src="/media/cms/images/plugins/image.png" alt="Bild - agi_2014_vecka46.png" id="plugin_obj_1385" title="Bild - agi_2014_vecka46.png"/></p><p>Utförligare\nförklaring av diagrammet:</p><p>Baserat på Hälsorapports\ndata visar ovanstående diagram den kumulativa incidensen av magsjuka veckovis\növer tid. Den grå linjen visar andelen (procenten) av Sveriges befolkning som\nfått magsjuka per vecka. I vänstra kanten av diagrammet syns skalan för den\nkumulativa incidensen veckovis. I den nedre kanten syns kalenderveckorna.\nObservera att skalan i vänstra kanten skiljer sig från den för diagrammet med\nluftvägsinfektion och influensaliknande sjukdom.</p><h3>Antal deltagare </h3><p>Resultaten för den\nsenaste veckan som visas i diagrammet bygger på rapporter från fler än 2506 deltagare\ni Hälsorapport.</p><p>Data kan bli missvisande\nom det är många som bara rapporterar när de är sjuka. Därför hoppas vi att alla\nsom är med rapporterar varje vecka, oavsett om de varit sjuka eller friska.  </p><h3><strong>Vad\nbetyder det att resultaten är viktade?</strong></h3><p>Eftersom åldersfördelningen för\nHälsorapports deltagare skiljer sig från hur den faktiska åldersfördelningen\nser ut i Sverige viktas resultaten baserat på ålder för att bättre spegla\nSveriges befolkning. Det innebär att sjukdomsrapporter i Hälsorapport får olika\ntyngd beroende på om den som är sjuk tillhör en åldersgrupp som är under- eller\növerrepresenterad jämfört med motsvarande åldersgrupp i Sveriges befolkning.\nKommer en sjukdomsrapport från en person i en åldersgrupp som är\növerrepresenterad får sjukdomsrapporten en lite lägre vikt, kommer\nsjukdomsrapporten istället från en person i en underrepresenterad åldersgrupp\nfår den en större vikt. </p>\n\n\n\n\n\n\n\n<p><em>Sidan uppdateras varje vecka fram till vecka 47, 2014.</em></p>	1363
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_735" title="Länk - Tillbaka till startsidan"/></p>	734
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_908" title="Länk - Tillbaka till startsidan"/></p>	907
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_851" title="Länk - Tillbaka till startsidan"/></p><p><a href="www.halsorapport.se/sv/nyhetsarkiv">Till nyhetsarkivet...</a></p>\n\n<br/>	850
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Frågor och svar" id="plugin_obj_648" title="Länk - Frågor och svar"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Jag vill gå med i Influensakoll" id="plugin_obj_649" title="Länk - Jag vill gå med i Influensakoll"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Influensaskolan" id="plugin_obj_650" title="Länk - Influensaskolan"/></p><p><img src="../../../../../+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_473" title="Link - \nTillbaka till startsidan"/> </p><p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_701" title="Kodstycke - Twitterbutton"/></p>	472
<p>V<em>isas inte kartan? Ladda då ner den senaste versionen av webbläsaren Mozilla Firefox genom att klicka på </em><a style="color: rgb(91, 128, 178); text-decoration: initial; font-family: 'Lucida Grande', 'DejaVu Sans', 'Bitstream Vera Sans', Verdana, Arial, sans-serif; font-size: 12px; font-style: italic; line-height: 16px;" href="http://www.mozilla.org/sv-SE/firefox/new/">http://www.mozilla.org/sv-SE/firefox/new/</a><em>. Programmet är gratis.</em></p>	1243
<h4>Jag är sjuk och behöver råd!</h4>\n<p>Tyvärr kan vi inte ta ställning till individuella vårdfrågor här på Hälsorapport. Vi föreslår att du ringer 1177 Vårdguiden på telefonnummer 1177.</p>\n<p>Du kan även hitta svar på många frågor på <a href="http://www.1177.se/">www.1177.se</a>.</p>	873
<br/><br/>	1109
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Jag vill gå med i Influensakoll" id="plugin_obj_764" title="Länk - Jag vill gå med i Influensakoll"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Frågor och svar" id="plugin_obj_766" title="Länk - Frågor och svar"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Rapportera" id="plugin_obj_765" title="Länk - Rapportera"/></p>	763
<p><img src="/+media/cms/images/plugins/link.png" alt="Link - Gå med" title="Link - Gå med" id="plugin_obj_615" /></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Rapportera" title="Link - Rapportera" id="plugin_obj_616" /></p>	614
<p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" title="Link - Tillbaka till startsidan" id="plugin_obj_611" /></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Kontakta oss" title="Link - Kontakta oss" id="plugin_obj_612" /></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Influensaskolan" title="Link - Influensaskolan" id="plugin_obj_613" /></p>	610
<p>Testa vad du kan om influensa!</p>	618
<p><img src="../../../images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_395" title="Link - Tillbaka till \nstartsidan"/></p><p><img src="../../../images/plugins/link.png" alt="Link - Kontakta oss" id="plugin_obj_394" title="Link - Kontakta oss"/></p>	389
<p style="FONT-STYLE: italic;">Visas inte kartan? Ladda då ner den senaste versionen av webbläsaren Mozilla Firefox genom att klicka på <a href="http://www.mozilla.org/sv-SE/firefox/new/">http://www.mozilla.org/sv-SE/firefox/new/</a>. Programmet är gratis. Vi jobbar på att få kartan att visas i alla webbläsare.</p>\n<p>Kartan visar de postnummerområden i Sverige där deltagare har rapporterat symptom på influensa de senaste 21 dagarna (rullande). Kartan ritas om varje dag och bygger på de rapporter som kommer in från deltagarna runt om i landet. </p>\n<p>På influensakartan kan du se i gult de områden där mellan 1 och 25 % av deltagare rapporterat influensaliknande symptom, i orange de områden där mellan 25 och 50 % av deltagare rapporterat influensaliknande symptom, i mörkorange de områden där mellan 50 och 75 % av deltagare rapporterat influensaliknande symptom, och i rött de områden där över 75 % av deltagare rapporterat influensaliknande symptom. Gröna områden visar de postnummerområden där mindre än 1% av deltagare rapporterat symptom.</p>\n<p>Hur tillförlitlig kartan är beror helt på hur många deltagare vi har. Just nu är färgerna på kartan baserade på relativt få deltagare och överskattar därför sjukligheten stort. Så sprid gärna <a href="http://www.influensakoll.se/">www.influensakoll.se</a> vidare till dina vänner och bekanta!</p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p>	1090
<h3>Karta 1: influensa</h3>	1278
<p><strong>Vecka 13 (26 mars - 1 april 2012)</strong></p>	1143
<p><strong>Vecka 9 (27 februari - 4 mars 2012)</strong></p>	1121
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_479" title="Link - Tillbaka till startsidan"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Läs mer om Influensakoll" id="plugin_obj_370" title="Link - Läs mer om Influensakoll"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_368" title="Link - Frågor och svar"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: veckodiagram" id="plugin_obj_1291" title="Länk - Sjukdomsläget: veckodiagram"/></p><p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: influensa" id="plugin_obj_1247" title="Länk - Sjukdomsläget: influensa"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: förkylning" id="plugin_obj_1246" title="Länk - Sjukdomsläget: förkylning"/></p>	511
<p><strong>Vecka 7 (13-19 februari 2012)</strong></p>	1123
	1149
<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>	1302
<h2>Sjukdomsläget: förkylning</h2><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Klicka här" id="plugin_obj_1249" title="Länk - Klicka här"/> för att komma till kartan över rapporterad förkylningssymptom.</p>	1248
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Rapportera för en annan profil" id="plugin_obj_688" title="Länk - Rapportera för en annan profil"/></p>	687
<h2>Sjukdomsläget: förkylning</h2>\n<p><a href="http://www.influensakoll.se/sv/karta/forkylning/">Klicka här</a> för att komma till kartan över rapporterad förkylning.</p>	931
<p><strong>Vad visar kartorna?</strong></p>\n<p>Varje karta visar de postnummerområden i Sverige där deltagare har rapporterat symptom på influensa under den aktuella veckan. </p>\n<p>På varje karta kan du se i gult de områden där mellan 1 och 10 deltagare rapporterat influensaliknande symptom, i orange de områden där mellan 11 och 30 deltagare rapporterat influensaliknande symptom, och i rött de områden där över 30 deltagare rapporterat influensaliknande symptom. Gröna områden visar de postnummerområden där deltagare rapporterat inga eller få symptom.</p>	1115
<h2>Sjukdomsläget: magsjuka</h2>\n<p><a href="http://www.influensakoll.se/sv/karta/magsjuka/">Klicka här</a> för att komma till kartan över rapporterad magsjuka.</p>	935
<br/>\n\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<h3><strong>Förklaring: karta 2</strong></h3><p>Färgskalan nedan visar andelen av rapporterna som tyder på influensaliknande sjukdom. Skalan hör till den nedre kartan på sidan.</p>\n<p><img src="/media/cms/images/plugins/image.png" alt="Bild - forklaringandel-fin-liten.png" id="plugin_obj_1276" title="Bild - forklaringandel-fin-liten.png"/></p>\n	1275
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - nyheter-illu.gif" id="plugin_obj_861" title="Bild - nyheter-illu.gif"/></p>\n<p><strong>Vinterkräksjukan är här</strong></p>\n<p>2011-12-13. När vi analyserar sökningar på webbplatsen Vårdguiden.se där ordet kräk ingår tyder sökdata på att vinterkräksjukan är här. <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Läs mer..." id="plugin_obj_862" title="Länk - Läs mer..."/></p>\n<p><strong>Kolla in alla nyheter </strong></p>\n<p>2011-12-02. Nu har vi lagt upp en <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - samlingssida" id="plugin_obj_863" title="Länk - samlingssida"/> för alla nyheter, både om influensa och influensakoll i media.</p>\n<p><strong>Mer än 750 deltagare! </strong></p>\n<p>2011-12-02. Tack till alla som anmält sig. Influensakolls deltagare bor över hela landet. Sprid gärna länken <a href="http://www.influensakoll.se/">www.influensakoll.se</a> vidare till vänner och bekanta. Ju fler som deltar desto säkrare blir resultaten!</p>\n<p><strong>Influensakoll med i Mitt-i-tidningarna </strong></p>\n<p>2011-11-30. I flera av veckans Mitt-i-tidningarna i Stockholmområdet finns Influensakoll med! Läs en av <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - artiklarna" id="plugin_obj_864" title="Länk - artiklarna"/>.</p>\n<p><strong>Influensaaktiviteten fortsatt låg </strong></p>\n<p>2011-11-26. I SMI:s <a href="http://www.smittskyddsinstitutet.se/publikationer/veckorapporter/influensarapporter/sasongen-20112012/influensarapport-vecka-46-1411---2011--2011/">influensarapport</a> för vecka 46 rapporteras att influensaaktiviteten var fortsatt låg, inte bara i hela Europa men också i övriga världen. Första studier om dubbelinfektioner och virusblandningar har publicerats.</p>	860
<p><img src="http://www.halsorapport.se/media/cms/images/plugins/link.png" alt="Länk - Läs mer om magsjuka" id="plugin_obj_1322" title="Länk - Läs mer om magsjuka"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Läs mer om influensa" id="plugin_obj_1323" title="Länk - Läs mer om influensa"/></p><p><a href="http://www.halsorapport.se/hjalp">Vår hjälpsida</a></p>	1321
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: influensa" id="plugin_obj_1094" title="Länk - Sjukdomsläget: influensa"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: förkylning" id="plugin_obj_965" title="Länk - Sjukdomsläget: förkylning"/> </p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: magsjuka" id="plugin_obj_964" title="Länk - Sjukdomsläget: magsjuka"/></p>	1086
<h2>Doktorns råd, 1941</h2>\n<p>Året är 1941 och doktor Stig Björkman intervjuas angående den annalkande influensasäsongen (1941-01-20). Hur skyddar man sig bäst mot influensa?   </p>\n<p>Man kan förstå att doktor Björkman och hans publik tar influensa på allvar eftersom de genomlevt Spanska Sjukan (1918-1919) då 10 procent av Sverige befolkning insjuknade och ungefär 30.000 personer dog. Mer om influensan och pandemier finns att läsa i vår <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Influensaskola" id="plugin_obj_906" title="Länk - Influensaskola"/>.</p>\n<p>Även om doktorn felaktigt skyller influensan på bakterier istället för virus har han många kloka råd. </p>\n<p><a href="http://www.youtube.com/watch?v=c2it96JbXtk">Se filmen här</a> (öppnar filmen på youtube)</p>	901
<p>Här visas det kumulativa antalet anmälda deltagare som angett en id-kod:</p>	1349
<h1>Sjukdomsläget vecka för vecka</h1>\n<p>Här på Influenskoll visar vi framför allt sjukdomsläget via kartor. Kartorna nedan visar rapporterad influensaliknande sjukdom bland deltagare, vecka för vecka (med den senaste kartan överst). Varje karta är alltså en ögonblicksbild. Kartorna visar postnummerområden där deltagare under varje kalendervecka rapporterat symptom som tyder på influensa. </p>\n<p>Det är viktigt att tänka på att antalet deltagare hela tiden ökat under säsongen, så de veckovisa kartorna speglar även att fler och fler gått med.  </p>\n<p><strong>Aktuell vecka</strong></p>\n<p>För att komma till den aktuella kartan över <strong>nuläget</strong>, klicka på <a href="http://www.influensakoll.se/sv/karta">sjukdomsläget: influensa</a>.</p>	1110
<h2>Se på film</h2>\n<p>I filmen nedan berättar statsepidemiologen Annika Linde om varför Influensakoll behövs och varför just du behövs som rapportör. Klicka på bilden nedan för att spela upp filmen.</p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/snippet.png" alt="Kodstycke - filmkort_mitten" id="plugin_obj_834" title="Kodstycke - filmkort_mitten"/></p>	1183
<p>Här kan vi se hur många som anmält sig!</p><p>Först en karta som visar vilka län deltagare kommer ifrån: </p>	651
<h1>Stort tack för dina svar! </h1>\n<p>Om du har frågor kring enkäten kan du kontakta oss via <a href="mailto:influensakoll@smi.se">halsorapport@smi.se</a>.</p>	1161
<h2>Lyssna: varför Influensakoll</h2>\n<p>I spelaren nedan kan du höra en intervju med statsepidemiologen Annika Linde om våra förhoppningar kring Influensakoll. </p>\n\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/snippet.png" alt="Kodstycke - SR_Annikaintervju" id="plugin_obj_1008" title="Kodstycke - SR_Annikaintervju"/></p>	1007
<p style="FONT-STYLE: italic;">Visas inte kartan? Ladda då ner den senaste versionen av webbläsaren Mozilla Firefox genom att klicka på <a href="http://www.mozilla.org/sv-SE/firefox/new/">http://www.mozilla.org/sv-SE/firefox/new/</a>. Programmet är gratis.</p>\n<h2>Sjukdomsläget: influensa</h2>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Klicka här" id="plugin_obj_1063" title="Länk - Klicka här"/> för att komma till kartan över rapporterad influensa.</p>	1001
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om Influensakoll" id="plugin_obj_1188" title="Länk - Om Influensakoll"/></p>\n<blockquote>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om EPIWORK" id="plugin_obj_1190" title="Länk - Om EPIWORK"/></p>\n<p><a href="https://www.influensakoll.se/sv/om-influensakoll/sasongen11-12/">Influensakolldeltagandet 2011-12</a></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Utvärderingsenkäten 2011-12 " id="plugin_obj_1214" title="Länk - Utvärderingsenkäten 2011-12 "/></p></blockquote>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen" id="plugin_obj_1193" title="Länk - Fakta om datainsamlingen"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Jag vill vara med" id="plugin_obj_327" title="Link - Jag vill vara med"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>	1260
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om Influensakoll" id="plugin_obj_1188" title="Länk - Om Influensakoll"/></p>\n<blockquote>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om EPIWORK" id="plugin_obj_1190" title="Länk - Om EPIWORK"/></p>\n<p><a href="https://www.influensakoll.se/sv/om-influensakoll/sasongen11-12/">Influensakolls deltagare 2011-12</a></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Utvärderingsenkäten 2011-12 " id="plugin_obj_1214" title="Länk - Utvärderingsenkäten 2011-12 "/></p></blockquote>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen" id="plugin_obj_1193" title="Länk - Fakta om datainsamlingen"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Jag vill vara med" id="plugin_obj_327" title="Link - Jag vill vara med"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>	1204
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Jag vill gå med i Influensakoll" id="plugin_obj_730" title="Länk - Jag vill gå med i Influensakoll"/></p>\n<p><img src="https://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Rapportera" id="plugin_obj_331" title="Link - Rapportera"/></p>	1189
<p><strong>Instruktioner</strong></p>\n<p>Klicka på + och - för att zooma in ditt lokalområde. Du kan flytta kartan med musen.</p>	976
<h1>Sjukdomsläget: influensa</h1>\n<p>Kartan visar postnummerområden där deltagare under de senaste sju dagarna rapporterat symptom som tyder på <strong><em>influensa.</em></strong></p>	926
<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<p><img src="/media/cms/images/plugins/image.png" alt="Bild - Logotyp" id="plugin_obj_1320" title="Bild - Logotyp"/></p>	1319
<h2>Tack för ditt meddelande! </h2>\n<p>Vi återkommer så snart som möjligt.</p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_740" title="Länk - Tillbaka till startsidan"/></p>	736
<p><strong>Vecka 6 (6-12 februari 2012)</strong></p>	1124
<p><img src="/media/cms/images/plugins/snippet.png" alt="Kodstycke - loggor_överkant" id="plugin_obj_758" title="Kodstycke - loggor_överkant"/></p>	672
	1205
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om Influensakoll" id="plugin_obj_1188" title="Länk - Om Influensakoll"/></p>\n<blockquote>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om EPIWORK" id="plugin_obj_1190" title="Länk - Om EPIWORK"/></p>\n<p><a href="https://www.influensakoll.se/sv/om-influensakoll/sasongen11-12/">Influensakolldeltagandet 2011-12</a></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Utvärderingsenkäten 2011-12 " id="plugin_obj_1214" title="Länk - Utvärderingsenkäten 2011-12 "/></p></blockquote>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Nyheter" id="plugin_obj_1220" title="Länk - Nyheter"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Länkar..." id="plugin_obj_1231" title="Länk - Länkar..."/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Nyhetsarkiv" id="plugin_obj_1221" title="Länk - Nyhetsarkiv"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>	1219
<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<p><img src="/media/cms/images/plugins/image.png" alt="Bild - Logotyp" id="plugin_obj_1320" title="Bild - Logotyp"/></p>	1325
<br/>\n<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<p><img src="/media/cms/images/plugins/image.png" alt="Bild - Logotyp" id="plugin_obj_1320" title="Bild - Logotyp"/></p>	1329
	1168
<p><strong>Vecka 14 (2-8 april 2012)</strong></p>	1150
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Om Hälsorapport" id="plugin_obj_1318" title="Länk - Om Hälsorapport"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen" id="plugin_obj_1193" title="Länk - Fakta om datainsamlingen"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>\n	1289
<h1>Influensakolls utvärderingsenkät</h1>\n<p>Som en del av utvärderingen har vi skapat denna utvärderingsenkät. Den innehåller frågor om hur det varit att delta i Influensakoll. Dina synpunkter om Influensakoll – oavsett om de är positiva eller negativa – hjälper oss att förbättra framtida forskning och sjukdomsövervakning. Resultatet av vår undersökning kommer du att kunna ta del av på Smittskyddsinstitutets webbplats <a href="http://www.smi.se/">www.smi.se</a>. </p>\n<h2>Instruktioner</h2>\n<p>Enkäten innehåller 19 frågor, med ett fåtal följdfrågor beroende på svaren på huvudfrågorna. Om du inte vill svara på en fråga kan du hoppa över den, men vi hoppas naturligtvis att du svarar på alla frågor. Välj helt enkelt det eller de svar som passar just dig bäst på varje fråga. </p>	1164
<p><strong>Vecka 11 (11-18 mars 2012)</strong></p>	1135
<p><strong>Vecka 10 (5-11 mars 2012)</strong></p>	1120
<p><strong>Vecka 8 (20-26 februari 2012)</strong></p>	1122
<h2>Sjukdomsläget: influensa (antal)</h2>\n<p><a href="http://www.influensakoll.se/sv/karta">Klicka här</a> för att komma till kartan över rapporterad influensa.</p>\n<h2>Sjukdomsläget: förkylning</h2>\n<p><a href="http://www.influensakoll.se/sv/karta/forkylning/">Klicka här</a> för att komma till kartan över rapporterad förkylning.</p>\n<h2>Sjukdomsläget: magsjuka</h2>\n<p><a href="http://www.influensakoll.se/sv/karta/magsjuka/">Klicka här</a> för att komma till kartan över rapporterad magsjuka.</p>	1091
<p><strong>Vecka 4 (23-29 januari 2012)</strong></p>	1130
<h1>Sjukdomsläget: influensa</h1>\n<p>Nedan visas två kartor som visar sjukdomsläget på länsnivå. De visar län där deltagare under de senaste sju dagarna rapporterat symptom som tyder på <strong><em>influensaliknande sjukdom. </em></strong>Färgerna visar vilken andelen av rapporterna som inkommit under de senaste 7 dagarna som tyder på influensaliknande sjukdom. Till vänster visas en förklaring av färgskalan (vilket skiljer sig i de två kartorna).<em style="font-weight: bold;"> </em>Kartorna är ännu i en utvecklingsfas, eftersom det är oklart vilka gränsvärden som ska användas. </p><p>Hur tillförlitlig kartorna är beror helt på hur många deltagare vi har. Just nu är färgerna på kartorna baserade på relativt få deltagare. Så sprid gärna www.influensakoll.se vidare till dina vänner och bekanta! </p><p><strong>Nyhet! </strong>Nu finns även diagram över andelen influensaliknande sjukdom och förkylning bland rapporter <img src="/media/cms/images/plugins/link.png" alt="Länk - Läs mer... " id="plugin_obj_1292" title="Länk - Läs mer... "/></p>	520
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Jag vill gå med i Influensakoll" id="plugin_obj_730" title="Länk - Jag vill gå med i Influensakoll"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Rapportera" id="plugin_obj_331" title="Link - Rapportera"/></p>	1261
<p><strong>Hälsorapport är avslutat</strong><br/>\n2015-01-12. Hälsorapport är nu avslutat och deltagare kan inte längre logga in på sin profilsida. Även den här webbplatsen kommer att stängas ner inom kort. Tack än en gång till alla som deltagit i pilotstudien!\n\n</p><p><strong>Hälsorapport stängs ner</strong><br/>\n2014-12-18. Vid årsskiftet stängs Hälsorapport ner. Om du vill logga in på din profilsida eller läsa något på Hälsorapports webbplats passa på innan 2 januari 2015.  \n</p><p><strong>Tack för enkätsvar</strong><br/>\n2014-12-15. Idag stängdes utvärderingsenkäten av Hälsorapport. Ett stort tack till alla som tagit sig tid att svara på frågorna!</p>	867
<p><strong>Instruktioner</strong></p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p>	1092
<p>För mer uppdaterade råd kring sjukdom, kontakta sjukvårdsrådgivningen 1177 per telefon (1177) eller webb (<img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - 1177" id="plugin_obj_910" title="Länk - 1177"/>) eller om du bor i Stockholm, Vårdguiden (08 320 100, <a href="http://www.vardguiden.se/">www.vardguiden.se</a>). </p>	909
	896
<p><strong>Kontakt</strong><br/>Om du vill komma i kontakt med oss är du välkommen att mejla<br/><img src="/media/cms/images/plugins/link.png" alt="Länk - halsorapport@folkhalsomyndigheten.se" id="plugin_obj_1335" title="Länk - halsorapport@folkhalsomyndigheten.se"/>.</p>	1332
<p>Här visas antalet som fyllt i bakgrundsenkäten per dag:</p>	1350
<h2>Fakta om datainsamlingen </h2>\n<p><em>(länka till annan sida med denna information ?)</em></p>\n<p>De uppgifter som du lämnar skyddas av offentlighets- och sekretesslagen och personuppgiftslagen. Ansvariga för dina personuppgifter är Smittskyddsinstitutet och Karolinska Institutet. Dina svar kommer att behandlas så att obehöriga inte kan ta del av dem. Genom att du svarar på frågorna ger du ditt godkännande till att Smittskyddsinstitutet och Karolinska Institutet hanterar dina personuppgifter. Undersökningens resultat redovisas endast genom statistiska sammanställningar, där enskilda personers identitet inte går att spåra. Dina personuppgifter kommer att bevaras så länge som behövs för att genomföra analysarbetet. Därefter kommer uppgifterna att gallras i enlighet med gällande regelverk. I enlighet med personuppgiftslagen och offentlighetsprincipen har du, om du så önskar, rätt till utdrag på de uppgifter som gäller dig i databasen. Du kan också få uppgifterna ändrade om de är felaktiga. Självklart måste vi, för att skydda alla registrerade emot obehörigt intrång, kontrollera identiteten på den som begär att få ut sådana uppgifter. Utdragen skickas därför till dig i rekommenderat brev.</p>\n<h2>Har du frågor om undersökningen? </h2>\n<p>Kontakta oss på influensakoll@smi.se. </p>	1166
<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om Influensakoll" id="plugin_obj_1188" title="Länk - Om Influensakoll"/></p>\n<blockquote>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Om EPIWORK" id="plugin_obj_1190" title="Länk - Om EPIWORK"/></p>\n<p><a href="https://www.influensakoll.se/sv/om-influensakoll/sasongen11-12/">Influensakolldeltagandet 2011-12</a></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Utvärderingsenkäten 2011-12 " id="plugin_obj_1214" title="Länk - Utvärderingsenkäten 2011-12 "/></p></blockquote>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen" id="plugin_obj_1193" title="Länk - Fakta om datainsamlingen"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Jag vill vara med" id="plugin_obj_327" title="Link - Jag vill vara med"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>	1215
<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_799" title="Länk - Tillbaka till startsidan"/></p>	793
<p><strong>Vecka 15 (9-15 april 2012)</strong></p>	1151
<h1>Jag vill bli influensarapportör</h1>\n<p>Du måste ha fyllt 15 år för att delta i Influensakoll. Som målsman kan du rapportera för ditt barn eller andra familjemedlemmar genom ditt eget användarkonto. Läs mer om hur man <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - hanterar flera profiler. " id="plugin_obj_639" title="Länk - hanterar flera profiler. "/></p>\n<p>Fick du en inbjudan på posten? Följ då instruktionerna nedan. När du fyller i bakgrundsenkäten är det viktigt att du knappar in den kod som står på din inbjudan. På så sätt vet vi att du är med i gruppen som fått inbjudan. Läs mer under <a href="http://www.influensakoll.se/"><em>Om Influensakoll</em></a>. Tack för att du går med.</p>\n<p>Genom att du går med i Influensakoll ger du ditt godkännande till att Smittskyddsinstitutet hanterar dina rapporterade uppgifter.<br/>Ansvariga för registret är Smittskyddsinstitutet. Dina rapporter och svar behandlas så att obehöriga inte kan ta del av dem. <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen." id="plugin_obj_640" title="Länk - Fakta om datainsamlingen."/></p>\n<h2>Så här gör du för att gå med:</h2>\n<p>1. För att delta i Influensakoll behöver du ett användarkonto. <br/>Klicka på <a href="http://www.influensakoll.se/sv/accounts/register/">Gå med i Influensakoll</a> längst upp till höger på sidan. Där anger du ett användarnamn, din e-postadress och ett lösenord. <strong>Det går inte att använda mellanslag</strong> i vare sig användarnamn eller lösenord. </p>\n<p>2. En aktiveringslänk skickas till den e-postadress du angivit. Klicka på länken för att aktivera ditt konto</p>\n<p>3. Skapa en eller flera profiler för ditt konto</p>\n<p>4. Besvara bakgrundsenkäten. <em>Om du fått inbjudan till Influensakoll på posten, knappar du in din kod i bakgrundsenkäten. </em></p>\n<p>När du är en av Influensakolls influensarapportörer får du varje vecka ett e-postmeddelande med en personlig länk till ett frågeformulär. Första frågan gäller om du haft några symptom (eller inte) sedan sist. Kom ihåg att rapportera varje vecka oavsett om du har några sjukdomssymptom eller inte. </p>\n<p>Har du frågor om undersökningen eller tekniska problem, vänligen kontakta oss på <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - influensakoll@smi.se" id="plugin_obj_642" title="Länk - influensakoll@smi.se"/>.</p>\n<h2>Alla kan gå med</h2>\n<p>Alla som bor i Sverige är välkomna att vara med i Influensakoll – unga, gamla, vaccinerade, ovaccinerade, friska och sjuka. Du behöver inte vara sjuk just nu för att gå med. Några personer har fått en inbjudan till att gå med på posten, men du behöver inte ha fått en inbjudan för att gå med. Alla är välkomna!</p>\n<h2>Influensakoll pågår till och med maj 2013</h2>\n<p>Rapporteringen till influensakoll pågår till och med maj 2013. Vi vet att många redan är sjuka när de går med som influensarapportörer i Influensakoll. Det är ganska naturligt eftersom det ofta är först då som man kommer i kontakt med den här sajten. Detta leder dock till en överskattning av sjukligheten bland dem som är alldeles nya influensarapportörer. Den mest tillförlitliga uppskattningen av sjukligheten kommer därför från dem som varit rapportörer under minst sex veckor i rad. </p>	48
<p>Kartan visar de postnummerområden i Sverige där deltagare har rapporterat symptom på magsjuka de senaste 7 dagarna (rullande). Kartan ritas automatiskt om varje dag och bygger på de rapporter som kommer in från deltagarna runt om i landet. </p>\n<p>På kartan kan du se i gult de områden där mellan 1 och 10 deltagare rapporterat symptom på magsjuka, i orange de områden där mellan 11 och 30 deltagare rapporterat symptom på magsjuka, och i rött de områden där över 30 deltagare rapporterat symptom på magsjuka. Gröna områden visar de postnummerområden där deltagare rapporterat inga eller få symptom.</p>\n<p>Hur tillförlitlig kartan är beror helt på hur många deltagare vi har. Just nu är färgerna på kartan baserade på relativt få deltagare. Så sprid gärna www.influensakoll.se vidare till dina vänner och bekanta!</p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p>	996
<p>Hur tillförlitlig kartan är beror helt på hur många deltagare vi har. Just nu är färgerna på kartan baserade på relativt få deltagare. Så sprid gärna www.influensakoll.se vidare till dina vänner och bekanta!</p>\n<p><strong>Nyhet! </strong>Nu finns även diagram över andelen influensaliknande sjukdom och förkylning bland rapporter <img src="/media/cms/images/plugins/link.png" alt="Länk - Läs mer... " id="plugin_obj_1292" title="Länk - Läs mer... "/></p>	1245
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_479" title="Link - Tillbaka till startsidan"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Läs mer om Influensakoll" id="plugin_obj_370" title="Link - Läs mer om Influensakoll"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_368" title="Link - Frågor och svar"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: veckodiagram" id="plugin_obj_1291" title="Länk - Sjukdomsläget: veckodiagram"/></p><p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: influensa" id="plugin_obj_1247" title="Länk - Sjukdomsläget: influensa"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Sjukdomsläget: förkylning" id="plugin_obj_1246" title="Länk - Sjukdomsläget: förkylning"/></p>	1002
<p><strong>Instruktioner</strong></p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p>	997
<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<p><img src="/media/cms/images/plugins/image.png" alt="Bild - Logotyp" id="plugin_obj_1320" title="Bild - Logotyp"/></p>	1327
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Jag vill gå med i Influensakoll" id="plugin_obj_739" title="Länk - Jag vill gå med i Influensakoll"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Rapportera" id="plugin_obj_738" title="Länk - Rapportera"/></p>	737
<h3>Karta 2: influensa</h3><p>För att få en tydligare bild av den influensaktivitet som rapporteras av deltagarna i Influensakoll har vi skapat en karta där gränsvärdena för färgerna är lägre. </p><p>Hur tillförlitlig kartorna är beror helt på hur många deltagare vi har. Vissa områden som ser ut att ha hög aktivitet har väldigt få deltagare. </p>	1273
<br/><br/>	1107
<p><img src="/media/cms/images/plugins/link.png" alt="Länk - Frågor och svar" id="plugin_obj_684" title="Länk - Frågor och svar"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Influensakolls resultat" id="plugin_obj_686" title="Länk - Influensakolls resultat"/></p><p><img src="/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till startsidan" id="plugin_obj_685" title="Länk - Tillbaka till startsidan"/></p>	683
<h1>Sjukdomsläget: influensa %</h1>\n<p>Kartan visar postnummerområden där deltagare under de senaste <strong>21 dagarna</strong> rapporterat symptom som tyder på <em>influensa</em>. </p>\n<p>Denna karta visar den <strong>andel (%)</strong> <strong>av rapporter</strong> som tyder på influensaliknande symptom. Eftersom det ännu är relativt få deltagare i varje postnummerområde överskattar kartan den verkliga sjukligheten i samhället. </p>\n<h4>Första kartan visar andelen i alla postnummerområden, medans den andra kartan endast visar andelen i de områden som har 5 eller fler deltagare. </h4>	1088
<p><strong>Instruktioner</strong></p>\n<p>Klicka på + och - för att zooma in ett område. Du kan flytta kartan med musen. </p>\n<p><strong>Visas inte kartorna? </strong></p>\n<p>Ladda då ner den senaste versionen av webbläsaren Mozilla Firefox genom att klicka på <a href="http://www.mozilla.org/sv-SE/firefox/new/">http://www.mozilla.org/sv-SE/firefox/new/</a>. Programmet är gratis. </p>	1118
	897
<h1>Länkar</h1>\n<p>På den här sidan kan du hitta länkar som kan vara av intresse, till exempel veckorapporter om influensa, vinterkräksjuka, och RS-virus. Till vänster hittar du länkar till Sveriges smittskyddsenheter.</p>	868
<p><img src="/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_479" title="Link - Tillbaka till startsidan"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Läs mer om Influensakoll" id="plugin_obj_370" title="Link - Läs mer om Influensakoll"/></p><p><img src="/+media/cms/images/plugins/link.png" alt="Link - Influensakola" id="plugin_obj_367" title="Link - Influensakola"/></p><p><img src="../../../images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_368" title="Link - Frågor och svar"/></p>	365
<h2>Råd från förr</h2>\n<p>Hur såg man på influensan år 1894? Och vad sa läkaren år 1941? Vi har hittat en intervju i Sveriges Televisions arkiv från år 1941 och instruktioner för hur man behandlar influensan från år 1894. <img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Klicka här för att komma till Råd från förr" id="plugin_obj_1179" title="Länk - Klicka här för att komma till Råd från förr"/>...</p>	1044
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_479" title="Link - Tillbaka till startsidan"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Läs mer om Influensakoll" id="plugin_obj_370" title="Link - Läs mer om Influensakoll"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Influensakola" id="plugin_obj_367" title="Link - Influensakola"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_368" title="Link - Frågor och svar"/></p>	991
<p><strong>Har du fått en inbjudan?</strong><br/>Du som fått en inbjudan till Hälsorapport är viktig! Du har blivit utvald genom statistiska metoder för att skapa en deltagargrupp som speglar Sveriges befolkning och kan inte ersättas av någon annan. Därför är inbjudan adresserad direkt till dig.</p><p><strong>Hjälp till att hålla koll på smittläget!</strong><br/>Du som deltar i Hälsorapport bidrar genom att rapportera om ditt hälsotillstånd varje vecka och vid behov besvara extra enkäter (högst tre under året). Om du går med får du dessutom bättre koll på din egen hälsa genom Hälsorapports Hälsologg. Där kan du följa hur du rapporterar din hälsa under året. Du bestämmer självklart själv om du vill delta eller inte.</p><p><strong>Så här går du med</strong><br/>För att gå med klickar du på "Gå med" överst till höger på sidan (blå knapp). Där fyller du i ett användarnamn, din mejladress och ett lösenord. Sedan får du ett bekräftelsemejl med en länk som du får klicka på. Sedan är det klart – och du är med. När du första gången ska rapportera får du fylla i den kod som står på din inbjudan och en kort bakgrundsenkät. </p>	1333
<h2>Influensa</h2>\n<h3>Europeiska smittskyddsmyndigheten ECDC</h3>\n<p>Besök gärna Europeiska smittskyddsmyndigheten ECDC:s sida om <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - säsongsinfluensan" id="plugin_obj_661" title="Länk - säsongsinfluensan"/>.</p>\n<h3>Världshälsoorganisationen WHO</h3>\n<p>Här kan du läsa WHO:s <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Senaste influensauppdateringen" id="plugin_obj_660" title="Länk - Senaste influensauppdateringen"/> .</p>\n<h2>Forskning.se</h2>\n<p>Forskning.se är en nationell webbplats för forskningsinformation som samlar och sorterar material om forskning i Sverige. Forskning.se drivs och utvecklas av tio myndigheter och stiftelser som finansierar forskning samt landets lärosäten. I styrgruppen sitter en representant från vardera finansiär samt totalt fyra representanter från landets lärosäten. Redaktionen är placerad på Vetenskapsrådet, som är förvaltande organ. Gå in på <img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - www.forskning.se" id="plugin_obj_742" title="Länk - www.forskning.se"/>. </p>	657
<h1>Sammanfattning - Utvärderingsenkäten 2011-12</h1>\n<p>I slutet av maj när den första säsongen av Influensakoll avslutades blev samtliga deltagare tillfrågade att besvara ett frågeformulär. Formuläret handlade dels om deltagarnas bakgrund och dels om hur deltagare upplevde att använda systemet. Av de 2658 personer som deltog i Influensakoll under säsongen 2011-12 svarade 758 personer på enkäten (29 %). </p>\n<h2>Deltagande</h2>\n<p>Majoriteten av de som besvarade frågeformuläret hade valt att gå med i Influenskoll för att stödja forskningen och för att de hade ett intresse för influensa eller sjukdomsövervakning (figur 1) och nästan alla (96 %) kan tänka sig att delta i något liknande igen. Det var vanligast bland de som besvarade frågeformuläret att man hade hört talas om Influensakoll genom sökningar på internet (18 %), genom sitt jobb (17 %) eller genom tidningar eller tidskrifter (13 %).</p>\n<p><strong><em>Figur 1. Diagrammet visar andel av totalt svarande per svarsalternativ om varför de valt att anmäla sig till Influensakoll. Varje svarande hade möjlighet att välja ett eller flera alternativ.</em></strong></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - varfordelta11-12.PNG" id="plugin_obj_1212" title="Bild - varfordelta11-12.PNG"/></p>\n<h2>Rapportering</h2>\n<p>De flesta (67 %) angav att de hade rapporterat till Influensakoll varje vecka. Bara en procent av alla som svarade på enkäten angav att de rapporterat endast när de var sjuka. Samtidigt var den näst vanligaste orsaken till att inte ha rapporterat att man var frisk så baserat på dessa svar är det svårt att veta hur stor påverkan aktuellt sjukdomstillstånd hade på benägenhet att rapportera. Den allra vanligaste anledningen att inte ha rapporterat en vecka var glömska. </p>\n<p>Av alla svarande tyckte ungefär tre fjärdedelar (72 %) att det var mycket enkelt att använda rapporteringssystemet och mer än hälften (64 %) tyckte att längden på rapporteringsenkäten var lagom lång. Majoriteten tyckte att 2-3 månader (40 %) och 4-5 månader (25 %) skulle vara lagom lång period att åta sig att rapportera till Influensakoll, (för en deltagare som gick med i början av säsongen 2011-12 var rapporteringsperioden cirka 6 månader). De flesta har inte råkat ut för några tekniska problem under säsongen men cirka en fjärdedel har stött på problem för att de glömt användarnamn och lösenord. </p>\n<h2>Nyhetsbrev</h2>\n<p>Mer än hälften av svaranden tyckte att Influensakolls nyhetsbrev som mailades varje vecka oftast var intressant (33 %) och intressant ibland (28 %). Endast 13 procent av de som besvarade frågeformuläret beskrev nyhetsbrevet som alltid intressant medan 21 procent inte hade någon uppfattning för att de oftast inte läste nyhetsbrevet. Bland förbättringsförslagen som angavs var det vanligaste ett önskemål om att kommunicera mer detaljerade resultat av Influensakoll (33 %) och dela mer information om andra sjukdomar förutom influensa (24 %), (figur 2) . </p>\n<p><em><strong>Figur 2. Diagrammet visar andel av totalt svarande per svarsalternativ om hur de skulle förbättra Influensakolls nyhetsbrev. Varje svarande hade möjlighet att välja ett eller flera alternativ.</strong></em></p>\n\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/image.png" alt="Bild - forbattranyhetsbrev11-12.PNG" id="plugin_obj_1213" title="Bild - forbattranyhetsbrev11-12.PNG"/></p>	1211
<h2><strong>EPIWORK</strong></h2>\n<p>Influensakoll drivs av Smittskyddsinstitutet i samarbete med Karolinska Institutet. Influensakoll är den svenska komponenten i ett Europeiskt system som kallas Influenzanet och ingår i EU-projektet EPIWORK. Projektet startade 2009 och finansieras av EU:s sjunde ramprogram (FP7). Syftet är att utveckla en infrastruktur för epidemiologiska prognoser. EPIWORK består av ett samarbete mellan 12 organisationer i 8 olika länder under 4 år. Läs mer om EPIWORK på <a href="http://www.epiwork.eu">www.epiwork.eu</a>.</p>\n<h2>Influenzanet</h2>\n<p>Influenzanet är ett webbaserat övervakningssystem som används för att följa förekomst av influensaliknande sjukdom i befolkningen. Influenzanet startades 2003 i Holland under namnet de Grote Griep Meting (“Den stora influensaundersökningen”). Sedan dess har mellan 20000 och 31000 frivilliga holländare och belgare rapporterat eventuella symtom varje vecka och på så sätt givit information om hur influensa och förkylningar sprider sig i Nederländerna och flamländska Belgien.</p>\n<p>Sedan 2005 har ett liknande webbaserade rapporteringssystem funnits i Portugal och sedan 2008 i Italien. Under 2009 lanserades systemet i Storbritannien och nu, 2011, startar Influensakoll i Sverige. Influenzanetsystemen runt om i Europa ingår alla i EPIWORK och informationen om för data om rapporterade symptom i dessa länders befolkningar samlas sedan hösten 2010 i en gemensam Europeisk databas. Informationen som samlas i den Europeiska databasen är avidentifierad och enskilda personers identitet går inte att spåra. Den informationen utvärderas och analyseras av epidemiologer och modellerare inom EPIWORK. </p>\n<p>Läs mer om Influenzanet på <a href="http://www.influenzanet.eu">www.influenzanet.eu</a>. </p>\n<p>Längst ner på sidan i det grå området kan du klicka dig fram till de andra europeiska sajterna. De är listade under rubriken Partners. </p>	1185
<h3>Hälsorapport är nu avslutat och den här webbplatsen kommer att stängas ner i januari 2015. Ett stort TACK till alla som deltagit i pilotstudien! </h3>\n\n<h2>Hälsorapport håller koll på smittläget</h2><p>Hälsorapports deltagare är speciellt inbjudna för att spegla befolkningen i Sverige. Varje vecka får deltagarna rapportera på Hälsorapports webbplats om de har varit friska eller sjuka. Om de har varit sjuka får de ange vilka symptom de haft. Tillsammans hjälper de till att kartlägga smittläget i landet.</p>	527
<br/><br/>\n<br/>\n<br/>\n<br/>\n<br/>\n<h3><strong>Förklaring: karta 1</strong></h3><p>Färgskalan nedan visar andelen av rapporterna som tyder på influensaliknande sjukdom. Skalan hör till den övre kartan på sidan.</p>	1253
<h1>Influensa</h1>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Tillbaka till influensaskolan" id="plugin_obj_420" title="Länk - Tillbaka till influensaskolan"/></p>\n<p>Influensa är en virussjukdom. Det finns tre typer av influensavirus; influensa A, B och C, som alla tillhör gruppen ortomyxovirus. Det är främst A och B som ger upphov till den typiska influensasjukdomen.</p>\n<h5><img src="http://www.influensakoll.se/+media/cms/images/plugins/image.png" alt="Picture - influensa-a-h1n1-01-fargad.jpg" id="plugin_obj_421" title="Picture - influensa-a-h1n1-01-fargad.jpg"/>Pandemivirus A (H1N1) </h5>\n<p>Smittämnet finns i svalget hos den sjuke och sprids till andra främst som fin, luftburen droppsmitta (aerosol) men även genom kontakt. Smittsamheten är mycket stor. Inkubationstiden är kort, ett till tre dygn. Av inte helt klarlagda skäl är influensasjukligheten nästan helt koncentrerad till vintersäsongen. Man brukar tala om ”influensasäsongen”, som tidigast brukar bryta ut i oktober-november och vanligtvis inte sträcker sig längre än in i början av maj. Det finns emellertid en ganska stor variation i influensasäsongernas ”timing” och varaktighet. Under influensapandemin 2009 sågs influensa redan under sensommaren. Åren dessförinnan tog inte säsongen fart förrän efter nyår. </p>\n<p>Influensa börjar ofta akut med frossa, snabbt stigande feber (ofta upp över 40°C), allmän muskelvärk, huvudvärk och därefter tilltagande symtom från luftvägarna, främst hosta. Ibland, och mest hos barn, förekommer symtom från mag- och tarmkanalen som kräkningar och diarré. Efter några dagar brukar tillståndet ge med sig och de flesta har tillfrisknat efter cirka 1 vecka. Sjukdomsbilden är ofta lindrigare än så och kan mer likna en vanlig förkylning.</p>\n<p>Behandlingen vid influensa är främst "symtomatisk", d.v.s. inte botande men symtomlindrande (t.ex. febernedsättande och inflammationsdämpande receptfria läkemedel med acetylsalicylsyra, paracetamol eller ibuprofen, näsdroppar, hostdämpande läkemedel etc.). Det finns antivirala medel som angriper det orsakande viruset, men effekten på sjukdomsförloppet är begränsad. För att sjukdomstiden ska förkortas måste antivirala medel ges tidigt i sjukdomsförloppet. Sådana medel kan även användas som profylax, d.v.s. de ges till ännu friska som utsatts för smitta för att förhindra att sjukdomen bryter ut. Baksidan är att virus kan utveckla motståndskraft mot antivirala medel, och om motståndskraftiga virus kommer i omlopp kan det bli till nackdel för alla. Därför används antivirala medel enbart i speciella situationer, t.ex. till riskgrupper som riskerar att få allvarliga komplikationer av influensan. Till de särskilda riskgrupperna räknas äldre personer (över 65 år), personer med allvarlig lungsjukdom som t.ex. astma, KOL eller emfysem, allvarlig hjärt- eller njursjukdom, diabetes, autoimmun sjukdom, eller med nedsatt immunförvar. För att minska behovet av antivirala medel även i dessa grupper erbjuds sådana personer förebyggande vaccination före varje ny influensasäsong. Den vanligaste komplikationen till influensa är att sjukdomsalstrande bakterier angriper de inflammerade luftvägarna så att en bakteriell lunginflammation uppstår. Att en bakteriell komplikation är på gång märker man på att symtomen (oftast febern och hostan), efter att först ha minskat successivt, verkar ta ny fart på femte eller sjätte dagen. Bakteriella komplikationer kräver läkarbedömning och behandlas med antibiotika.</p>\n<p>Influensavirus är mycket föränderligt, och därför kan man insjukna i influensa flera gånger. Ibland räcker skyddet helt eller delvis under några års tid. Ibland, då influensavirus ändrat skepnad totalt, blir alla helt mottagliga. Senast hände detta i världen 2009 då den nya influensan började spridas världen över. Mer om immunitet mot influensan finner du under avsnittet <img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Pandemier" id="plugin_obj_422" title="Link - Pandemier"/>. </p>\n<p>Har du frågor om influensa? I influensakolls <img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - FAQ" id="plugin_obj_424" title="Link - FAQ"/> hittar du svar på vanliga frågor. Du kan också läsa mer om influensa på <a href="http://www.smittskyddsinstitutet.se/sjukdomar/influensa/">SMI:s sjukdomssida om influensa</a> eller <a href="http://www.1177.se/Stockholm/Fakta-och-rad/Sjukdomar/Influensa/">1177:s sida om influensa</a>. </p>\n<p>http://www.smittskyddsinstitutet.se/sjukdomar/influensa/</p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till influensaskolan" id="plugin_obj_425" title="Link - Tillbaka till influensaskolan"/></p>\n<p><img src="http://www.influensakoll.se/media/cms/images/plugins/snippet.png" alt="Kodstycke - Twitterbutton" id="plugin_obj_702" title="Kodstycke - Twitterbutton"/></p>	405
<p><strong>Utvärderingsenkäten fortfarande öppen</strong><br/>2014-12-11. Utvärderingsenkäten av Hälsorapport är fortfarande öppen. Ni som ännu inte har svarat är välkomna att göra det. </p><p><strong>Extra nyhetsbrev av misstag</strong><br/>2014-12-01. Idag fick alla deltagare av misstag samma nyhetsbrev som förra veckan. Vi ber er bortse från detta. Återigen tack att ni deltagit i Hälsorapport och att ni tar er tid att besvara utvärderingsenkäten.</p><p><strong>Utvärdering av Hälsorapport</strong><br/>2014-11-27. Idag har alla deltagare fått ett mejl med en länk till en\nutvärderingsenkät. Vi tackar på förhand att ni tar er tid att besvara enkäten.\nEra svar är viktiga och kommer påverka Hälsorapports framtid.</p>\n<p><strong>Utvärdering av Hälsorapport</strong><br/>2014-11-27. Idag har alla deltagare fått ett mejl med en länk till en\nutvärderingsenkät. Vi tackar på förhand att ni tar er tid att besvara enkäten.\nEra svar är viktiga och kommer påverka Hälsorapports framtid.</p>\n<p><strong>Säkerhetscertifikatet åtgärdat</strong><br/>\n2014-11-11. Deltagare ska nu kunna rapportera som vanligt igen via rapporteringslänken i nyhetsbrevet. Om ni har fortsatta problem kontakta oss på <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a></p><p><strong>Problem med Hälsorapports säkerhetscertifikat</strong><br/>2014-11-10. Just nu har vi problem med uppdatering av Hälsorapports säkerhetscertifikat. Om du går till Hälsorapports webbplats får du förmodligen ett felmeddelande. Du kan ignorera felmeddelandet och på ett säkert sätt klicka dig vidare och rapportera som vanligt. Veckans nyhetsbrev skickas ut senare under dagen.</p><p><strong>Tack för enkätsvar</strong><br/>2014-10-20. Idag stängdes enkäten om antibiotika. Ett stort tack till alla som tagit sig tid att svara på frågorna!</p><p><strong>God svarsfrekvens på enkät om antibiotika</strong><br/>2014-10-17. Hittills har 81% svarat på enkäten om antibiotika,\nenligt våra preliminära uträkningar. Stort tack till alla som svarat!</p>\n\n<p><strong>Enkät om antibiotika fortfarande öppen</strong><br/>2014-10-03. Enkäten om antibiotika är fortfarande öppen så ni som ännu inte har svarat är välkomna att göra det. </p><p><strong>Enkät om antibiotika</strong><br/>2014-09-15. Nu i veckan kommer alla deltagare\ni Hälsorapport att få ett mejl med en länk till en kort enkät som handlar om\nantibiotika. Vi hoppas att ni har tid att svara på enkäten. </p>\n\n<p>\n<strong>Karta på Hälsorapport</strong>\n<br/>2014-07-31. När du är inloggad i din privata hälsologg på Hälsorapports webbplats kan du längst ner på sidan se en karta. Kartan visar förekomsten av luftvägsinfektion som Hälsorapports deltagare har rapporterat in. \n</p>\n\n\n\n<p><strong>Hjälpsida </strong><br/>2014-07-16. Om du har tekniska problem eller frågor om Hälsorapport kan du titta under fliken Hjälp eller kontakta oss på <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a></p><p><strong>Tack för enkätsvar </strong><br/>2014-07-07. Ett stort tack till er som i mars besvarade en enkät för att utreda ett utbrott. Era svar har hjälpt Folkhälsomyndigheten framåt i den pågående utredningen.</p>\n<p><strong>Hälsorapport pågår som vanligt under sommaren</strong><br/>2014-06-27. Nyhetsbreven med påminnelse om att rapportera skickas ut varje måndag även under sommaren. Vi tackar alla deltagare som är med och rapporterar varje vecka!</p>\n<p><strong>Hälsorapport önskar alla en trevlig midsommarhelg!</strong><br/>2014-06-16.</p><p><strong>Internationell konferens</strong><br/>2014-05-08. Vid en konferens som organiseras av Världshälsoorganisationen och den europeiska smittskyddsmyndigheten kommer Folkhälsomyndigheten att presentera Hälsorapport som ett exempel på ett nytt övervakningssystem. Mötet äger rum i juni. </p>\n<p><strong>Nätverksproblem </strong><br/>2014-05-02. I början på vecka 18 hade Hälsorapport nätverksproblem vilket kan ha försvårat rapporteringen. Problemet ska nu vara löst. </p>\n<p><strong>Resultatsidan uppdateras varje vecka </strong><br/>2014-04-25. Där kan ni följa den uppskattade förekomsten av luftvägsinfektion, influensaliknande sjukdom och magsjuka i Sverige. Diagrammen är baserade på vad som rapporterats till Hälsorapport.</p>\n<p><strong>God svarsfrekvens på enkät </strong><br/>2014-04-11. I veckan avslutades en enkät som skickats till omkring 180 deltagare i Hälsorapport för att utreda ett utbrott. På lite mer än en vecka svarade 80% av de tillfrågade på enkäten. </p>\n<p><strong>Glad påsk önskar vi på Hälsorapport </strong><br/>2014-04-17. Eftersom måndag är en helgdag kommer du istället att få nyhetsbrevet på tisdag nästa vecka.  </p>\n<p><strong>Nu finns en Resultatsida </strong><br/>2014-04-03. Under fliken Resultat kan ni varje vecka följa den uppskattade förekomsten av luftvägsinfektion, influensaliknande sjukdom och magsjuka i befolkningen. Diagrammen är baserade på vad som rapporterats till Hälsorapport.</p>\n<p><strong>Enkät för att utreda ett utbrott</strong><br/> 2014-03-28. Igår fick omkring 180 deltagare i Hälsorapport en förfrågan om att besvara en enkät. Förhoppningen är att svaren ska hjälpa Folkhälsomyndigheten att utreda ett utbrott av en smittsam sjukdom som misstänks ha smittat via mat.</p>\n<p><strong>God svarsfrekvens på enkät</strong> <br/>2014-04-11. I veckan avslutades en enkät som skickats till omkring 180 deltagare i Hälsorapport för att utreda ett utbrott. På lite mer än en vecka svarade 80% av de tillfrågade på enkäten. </p>\n<p><strong>Nu finns en Resultatsida </strong><br/>2014-04-03. Under fliken Resultat kan ni varje vecka följa den uppskattade förekomsten av luftvägsinfektion, influensaliknande sjukdom och magsjuka i befolkningen. Diagrammen är baserade på vad som rapporterats till Hälsorapport.</p>\n<p><strong>Enkät för att utreda ett utbrott</strong><br/>2014-03-28. Igår fick omkring 180 deltagare i Hälsorapport en förfrågan om att besvara en enkät. Förhoppningen är att svaren ska hjälpa Folkhälsomyndigheten att utreda ett utbrott av en smittsam sjukdom som misstänks ha smittat via mat.</p>\n<p><strong>Webbplatsen åter igång</strong><br/>2014-01-23. Nu är Hälsorapport.se åter igång och nyhetsbrevet för vecka 3 går ut cirka 17 idag, torsdag. Vi vill tacka er för ert tålamod!</p>\n<p><strong>Tekniska problem </strong><br/>2014-01-22. Hälsorapport.se har legat nere i cirka 24 timmar. Nu hoppas vi att systemet är stabilt och att vi kan skicka ut nyhetsbrevet imorgon, torsdag. </p>\n<p><strong>Folkhälsomyndigheten har skapats</strong><br/>2014-01-10. Den 1 januari 2014 skapades Folkhälsomyndigheten, en nationell kunskapsmyndighet med ett övergripande ansvar för folkhälsofrågor. Myndigheten är en sammanslagning av Smittskyddsinstitutet, Statens folkhälsoinstitut och delar av Socialstyrelsen. Läs mer på <a href="http://www.folkhalsomyndigheten.se">www.folkhalsomyndigheten.se</a>. </p>\n<p><strong>Influensan ökar men ingen jultopp</strong><br/>2013-12-20. Förra veckan rapporterades ett ökande antal fall av influensa från laboratorierna i Sverige, men än är vi bara i början av epidemin.  </p>\n<p><strong>God Jul från Hälsorapport</strong><br/>2013-12-17. Under julhelgen kommer nyhetsbreven som vanligt på måndagar. Vi hoppas att du har möjlighet att rapportera!</p>\n<p><strong>Hälsorapport har nu +3000 deltagare</strong><br/>2013-12-17. Tack till alla som gått med! Vi är nu nära vårt mål på 3500 deltagare.</p>\n<p><strong>Webbsök för influensa ökar</strong><br/>2013-12-09. Webbsök visar en ökning och har nu gått över den gräns som tyder\npå att influensasäsongen har startat i Sverige. <a href="http://www.folkhalsomyndigheten.se/amnesomraden/statistik-och-undersokningar/sjukdomsstatistik/influensa-veckorapporter/webbsok-for-influensa/20132014/">Länk\ntill Webbsök</a>.</p>\n<p><strong>Webbplatsen uppgraderad</strong><br/>2013-12-05. Idag har Hälsorapport webbplats uppgraderats med några smärre förbättringar. Till exempel har textfälten blivit större i enkäterna och kontrollord har lagts till på kontaktsidan. <br/><br/>Webbplatsen ska fungera som vanligt. Om något ser konstigt ut, testa att hålla ner CTRL och F5 samtidigt. Då rensas din webbläsare så den kan se det nya. </p>\n<p><strong>Vinterkräksjukan är här</strong><br/>2013-11-25. Vi kan förvänta oss att vinterkräksjukan nu börjar ta fart. Förra veckan passerade antalet sökningar på ordet "vinterkräksjukan" på webbplatsen 1177.se gränsen för epidemistart. </p>\n<p><strong>Om Hälsorapport i media</strong><br/>2013-11-15. Idag har SVT:s Östnytt gjort ett inslag om projektet. <a href="http://www.svt.se/nyheter/regionalt/ostnytt/svenskars-influensa-ska-kartlaggas">Läs och se inslaget här...</a> </p>\n<p><strong>Redan har 1000+ gått med!</strong><br/>2013-11-15. Tack till alla som redan gått med. Idag har vi nått 1000-deltagarstrecket. Men än är det långt kvar till målet på 3500 av de inbjudna. </p>\n<p><strong>Nu startar Hälsorapport!</strong><br/>2013-11-11. Hälsorapport är Smittskyddsinstitutets nya system för att hålla koll på infektionsläget i Sverige. Under november 2013 går en inbjudan ut till cirka 35000 personer i Sverige. </p>	1176
<h2>Hälsorapports hjälpsida</h2>\n<p><em>Mejla gärna </em><a href="mailto:halsorapport@folkhalsomyndigheten.se"><em>halsorapport@folkhalsomyndigheten.se</em></a><em> om du saknar något ämne.</em></p>\n<h3><strong>Jag kan inte anmäla mig</strong></h3>\n<p>Om du får felmeddelanden när du försöker anmäla dig (genom <a href="http://www.halsorapport.se/sv/accounts/register/">gå med</a>-länken) så kan det vara för att du försökt använda mellanslag i användarnamn eller lösenord. Följande tecken är tillåtna: bindestreck, underscore (_), å, ä, ö, @, med flera. </p>\n<p>Det kan också vara så att användarnamnet redan är "taget" av en annan deltagare. Tyvärr ser felmeddelandet detsamma ut oavsett anledning. Om du inte kan anmäla dig med det användarnamn du provar först, prova att till exempel lägga till en siffra efter användarnamnet. Det går även bra att använda sin e-postadress som användarnamn.</p>\n<p>Om du behöver mer hjälp, har fått något annat felmeddelande eller får ett felmeddelande trots att det användarnamn och lösenord du fyller i stämmer in på dessa regler, kontakta oss gärna på <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a>.</p>\n<h3>Jag vill inte få fler nyhetsbrev</h3>\n<p>Varje vecka får alla aktiva deltagare ett nyhetsbrev via e-post. Dessa skickas automatiskt varje måndag eftermiddag. Om du vill avregistrera ditt användarkonto från utskickslistan för nyhetsbreven, klicka på <a href="http://www.halsorapport.se/sv/reminder/unsubscribe/">ta bort mig</a> för att <em><strong>avbeställa påminnelser</strong></em>.</p>\n<h3>Jag kan inte logga in på mitt konto</h3>\n<p>Då och då stöter vi på problemet att deltagare inte kan logga in med vissa versioner av Internet Explorer. Om du har möjlighet att försöka i en annan webbläsare, t.ex. Firefox, Google Chrome, osv., kan det lösa problemet. Skicka gärna ett meddelande om problemet till <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a>.</p>\n<h3>Jag har glömt mitt lösenord</h3>\n<p>För att återställa ditt lösenord, gå in på <a href="http://www.halsorapport.se/sv/accounts/password/reset/">glömt lösenord</a>.</p>\n<h3>Jag har glömt mitt användarnamn</h3>\n<p>Om du glömt ditt användarnamn kan du antingen be om ett nytt lösenord (<a href="http://www.halsorapport.se/sv/accounts/password/reset/">glömt lösenord</a> - så får du ett mejl med ditt användarnamn) eller kontakta oss på <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a>.</p>\n<h3>Jag vill ändra mitt lösenord</h3>\n<p>Klicka på <a href="http://www.halsorapport.se/sv/accounts/password/change/">ändra lösenord</a> för att ändra ditt lösenord (om du vet ditt gamla lösenord).</p>\n<h3>Jag vill ändra mitt användarnamn</h3>\n<p>Om du vill ändra ditt användarnamn, skicka ett mejl till <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a> med ditt nuvarande användarnamn samt vad du vill byta det till.</p>\n<h3>Jag vill ändra min mejladress</h3><p>Om du vill ändra din mejladress, skicka ett mejl till <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a> med din nuvarande mejladress samt vilken mejladress du vill byta till.</p><h3>Hur kommer jag åt mitt konto?</h3>\n<p>Logga först in och klicka sedan på <a href="http://www.halsorapport.se/sv/survey/thanks/">mitt konto</a> längst upp till höger på sidan (blå knapp). </p>\n<h3>Jag vill gå med</h3>\n<p>För att gå med i Hälsorapport ska du ha fått en inbjudan på posten under november 2013. Om du fått en inbjudan <a href="http://www.halsorapport.se/sv/accounts/register/">går du med</a> i Hälsorapport genom att ange ett användarnamn, din mejladress, och ett lösenord.</p>\n<h3>Jag vill gå ur</h3>\n<p>Om du vill avsluta ditt deltagande, skicka ett mejl till <a href="mailto:halsorapport@folkhalsomyndigheten.se">halsorapport@folkhalsomyndigheten.se</a> med ditt användarnamn och den e-postadress som du registrerat i systemet. Då avaktiverar vi ditt konto. Om du inte vill att de data du hittills lämnat (till exempel, svar på enkäter) är med i våra analyser ber vi dig skriva det i mejlet till oss. Alla analyser sker på avidentifierade data, där individers identitet inte går att spåra.</p>	794
<p><strong>Vecka 12 (19-25 mars 2012)</strong></p>	1142
<p><strong>Vecka 5 (30 januari - 5 februari 2012)</strong></p>	1125
<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Frågor och svar" id="plugin_obj_325" title="Link - Frågor och svar"/></p>\n<p><img src="https://www.influensakoll.se/media/cms/images/plugins/link.png" alt="Länk - Fakta om datainsamlingen" id="plugin_obj_1193" title="Länk - Fakta om datainsamlingen"/></p>\n<p><img src="http://www.influensakoll.se/+media/cms/images/plugins/link.png" alt="Link - Tillbaka till startsidan" id="plugin_obj_592" title="Link - Tillbaka till startsidan"/></p>	324
\.


--
-- Data for Name: contest_prediction; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY contest_prediction (id, user_id, date) FROM stdin;
\.


--
-- Name: contest_prediction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('contest_prediction_id_seq', 1, false);


--
-- Data for Name: contest_week; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY contest_week (id, number, value, prediction_id) FROM stdin;
\.


--
-- Name: contest_week_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('contest_week_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2015-10-10 05:32:23.338635+02	1	63	5	TranslationSurvey(sv) for Survey #2 Weekly 2013-2014	2	Ändrade status.
2	2015-10-10 05:32:33.968421+02	1	63	3	TranslationSurvey(sv) for Survey #1 Intake 2013-2014	2	Ändrade status.
3	2015-10-10 05:37:25.300585+02	1	8	1	example.com	2	Ändrade logo på Sajtens Inställningar "Sajtens Inställningar".
4	2015-10-10 05:53:42.566627+02	1	54	2	Survey #2 Weekly 2013-2014	2	Ändrade status.
5	2015-10-10 05:53:48.594639+02	1	54	1	Survey #1 Intake 2013-2014	2	Ändrade status.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 5, true);


--
-- Data for Name: django_cache; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY django_cache (cache_key, value, expires) FROM stdin;
:1:cms-menu_nodes_sv_1	gAJdcQEoY21lbnVzLmJhc2UKTmF2aWdhdGlvbk5vZGUKcQIpgXEDfXEEKFUIX2NvdW50ZXJxBUsB\nVQV0aXRsZXEGY2RqYW5nby51dGlscy5mdW5jdGlvbmFsCl9sYXp5X3Byb3h5X3VucGlja2xlCnEH\nKGNkamFuZ28udXRpbHMudHJhbnNsYXRpb24KdWdldHRleHQKcQhVD1N5bXB0b21zIHN1cnZleXEJ\nhXEKfXELY19fYnVpbHRpbl9fCnVuaWNvZGUKcQx0UnENVQN1cmxxDlUIL3N1cnZleS9VCW5hbWVz\ncGFjZXEPVQpTdXJ2ZXlNZW51cRBVB3Zpc2libGVxEYhVCGNoaWxkcmVucRJdVQlwYXJlbnRfaWRx\nE05VEHBhcmVudF9uYW1lc3BhY2VxFE5VAmlkcRVVC3ZpZXdzLmluZGV4cRZ1YmgCKYFxF31xGCho\nBUsBaAZoByhoCFUQTWFuYWdlIGhvdXNlaG9sZHEZhXEafXEbaAx0UnEcaA5VDy9zdXJ2ZXkvcGVv\ncGxlL2gPaBBoEYhoEl1oE05oFE5oFVUMdmlld3MucGVvcGxlcR11YmgCKYFxHn1xHyhoBUsBaAZo\nByhoCFULTXkgc2V0dGluZ3NxIIVxIX1xImgMdFJxI2gOVRMvYWNjb3VudHMvc2V0dGluZ3MvaA9o\nEGgRiGgSXWgTTmgUTmgVVRphY2NvdW50c192aWV3cy5teV9zZXR0aW5nc3EkdWJoAimBcSV9cSYo\naAVLAWgGaAcoaAhVD0NoYW5nZSBwYXNzd29yZHEnhXEofXEpaAx0UnEqaA5VGi9hY2NvdW50cy9w\nYXNzd29yZC9jaGFuZ2UvaA9oEGgRiGgSXWgTTmgUTmgVVRphdXRoX3ZpZXdzLnBhc3N3b3JkX2No\nYW5nZXErdWJoAimBcSx9cS0oaAVLAVUEYXR0cnEufXEvKFUZdmlzaWJsZV9mb3JfYXV0aGVudGlj\nYXRlZHEwiFUNYXV0aF9yZXF1aXJlZHExiVUKcmV2ZXJzZV9pZHEyTlUJc29mdF9yb290cTOJVRV2\naXNpYmxlX2Zvcl9hbm9ueW1vdXNxNIhVDHJlZGlyZWN0X3VybHE1WAAAAAB1aAZYAwAAAEhlbWgO\nWAUAAAAvaGVtL2gPVQdDTVNNZW51cTZoEYhoEl1oE05oFE5oFUsHdWJoAimBcTd9cTgoaAVLAWgu\nfXE5KGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1aAZYCAAAAGRva3VtZW50aA5YCgAAAC9kb2t1bWVu\ndC9oD2g2aBGJaBJdaBNOaBROaBVLBHViaAIpgXE6fXE7KGgFSwFoLn1xPChoMIhoMYloMk5oM4lo\nNIhoNVgAAAAAdWgGWBAAAABPbSBIw6Rsc29yYXBwb3J0aA5YBAAAAC9vbS9oD2g2aBGIaBJdaBNO\naBROaBVLHnViaAIpgXE9fXE+KGgFSwFoLn1xPyhoMIhoMYloMk5oM4loNIhoNVgAAAAAdWgGWAgA\nAABSZXN1bHRhdGgOWAoAAAAvcmVzdWx0YXQvaA9oNmgRiGgSXWgTTmgUTmgVS0t1YmgCKYFxQH1x\nQShoBUsBaC59cUIoaDCIaDGJaDJOaDOJaDSIaDVYAAAAAHVoBlgOAAAARnLDpWdvciAmIHN2YXJo\nDlgFAAAAL2ZhcS9oD2g2aBGIaBJdaBNOaBROaBVLC3ViaAIpgXFDfXFEKGgFSwFoLn1xRShoMIho\nMYloMk5oM4loNIhoNVgAAAAAdWgGWBgAAABGYWt0YSBvbSBkYXRhaW5zYW1saW5nZW5oDlgaAAAA\nL2Zha3RhLW9tLWRhdGFpbnNhbWxpbmdlbi9oD2g2aBGJaBJdaBNOaBROaBVLGHViaAIpgXFGfXFH\nKGgFSwFoLn1xSChoMIhoMYloMk5oM4loNIhoNVgAAAAAdWgGWAcAAABMw6Rua2FyaA5YCAAAAC9s\nYW5rYXIvaA9oNmgRiGgSXWgTTmgUTmgVSz51YmgCKYFxSX1xSihoBUsBaC59cUsoaDCIaDGJaDJO\naDOJaDSIaDVYAAAAAHVoBlgLAAAATnloZXRzYXJraXZoDlgNAAAAL255aGV0c2Fya2l2L2gPaDZo\nEYloEl1oE05oFE5oFUtRdWJoAimBcUx9cU0oaAVLAWgufXFOKGgwiGgxiWgyTmgziWg0iGg1WAAA\nAAB1aAZYBgAAAEhqw6RscGgOWAcAAAAvaGphbHAvaA9oNmgRiGgSXWgTTmgUTmgVSz91YmgCKYFx\nT31xUChoBUsBaC59cVEoaDCIaDGJaDJYBwAAAGNvbnRhY3RoM4loNIhoNVgAAAAAdWgGWAcAAABL\nb250YWt0aA5YCQAAAC9jb250YWN0L2gPaDZoEYhoEl1xUmgCKYFxU31xVChoBUsBaC59cVUoaDCI\naDGJaDJOaDOJaDSIaDVYAAAAAHVVBnBhcmVudHFWaE9oBlgEAAAAc2VudGgOWA4AAAAvY29udGFj\ndC9zZW50L2gPaDZoEYloEl1oE0sdaBRoNmgVSz11YmFoE05oFE5oFUsddWJoU2gCKYFxV31xWCho\nBUsBaC59cVkoaDCIaDGIaDJOaDOJaDSIaDVYAAAAAHVoBlgKAAAAbG9naW5fcGFnZWgOWAwAAAAv\nbG9naW5fcGFnZS9oD2g2aBGJaBJdaBNOaBROaBVLMnViaAIpgXFafXFbKGgFSwFoLn1xXChoMIho\nMYloMk5oM4loNIhoNVgAAAAAdWgGWAcAAABhdnNsdXRhaA5YCQAAAC9hdnNsdXRhL2gPaDZoEYlo\nEl1oE05oFE5oFUs1dWJoAimBcV19cV4oaAVLAWgufXFfKGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1\naAZYEAAAAEZyw6VnZWbDtnJtdWzDpHJoDlgIAAAAL3N1cnZleS9oD2g2aBGJaBJdcWBoAimBcWF9\ncWIoaAVLAWgufXFjKGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1aFZoXWgGWAQAAAB0YWNraA5YDQAA\nAC9zdXJ2ZXkvdGFjay9oD2g2aBGJaBJdaBNLA2gUaDZoFUs8dWJhaBNOaBROaBVLA3ViaGFoAimB\ncWR9cWUoaAVLAWgufXFmKGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1aAZYCQAAAERhc2hib2FyZGgO\nWAsAAAAvZGFzaGJvYXJkL2gPaDZoEYloEl1oE05oFE5oFUs5dWJoAimBcWd9cWgoaAVLAWgufXFp\nKGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1aAZYBAAAAHRhY2toDlgGAAAAL3RhY2svaA9oNmgRiWgS\nXWgTTmgUTmgVS011YmgCKYFxan1xayhoBUsBaC59cWwoaDCIaDGJaDJOaDOJaDSIaDVYAAAAAHVo\nBlgHAAAAc3VydmV5c2gOWAkAAAAvc3VydmV5cy9oD2g2aBGJaBJdcW1oAimBcW59cW8oaAVLAWgu\nfXFwKGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1aFZoamgGWAsAAAB1dHZhcmRlcmluZ2gOWBUAAAAv\nc3VydmV5cy91dHZhcmRlcmluZy9oD2g2aBGJaBJdaBNLT2gUaDZoFUtQdWJhaBNOaBROaBVLT3Vi\naG5oAimBcXF9cXIoaAVLAWgufXFzKGgwiGgxiWgyTmgziWg0iGg1WAAAAAB1aAZYCAAAAGFjY291\nbnRzaA5YCgAAAC9hY2NvdW50cy9oD2g2aBGJaBJdcXRoAimBcXV9cXYoaAVLAWgufXF3KGgwiGgx\niWgyTmgziWg0iGg1WAAAAAB1aFZocWgGWAgAAAByZWdpc3RlcmgOWBMAAAAvYWNjb3VudHMvcmVn\naXN0ZXIvaA9oNmgRiWgSXWgTS1poFGg2aBVLW3ViYWgTTmgUTmgVS1p1Ymh1ZS4=	2015-10-10 07:11:19+02
:1:cms--language-chooser-1-sv-raw	gAJdcQEoVQJlbnECWAcAAABFbmdsaXNocQOGcQRVAmRlcQVYBwAAAERldXRzY2hxBoZxB1UCZnJx\nCFgJAAAARnJhbsOnYWlzcQmGcQpVAm5scQtYCgAAAE5lZGVybGFuZHNxDIZxDVUCaXRxDlgIAAAA\nSXRhbGlhbm9xD4ZxEFUCc3ZxEVgHAAAAU3ZlbnNrYXEShnETVQJwdHEUWAoAAABQb3J0dWd1w6pz\ncRWGcRZVAmVzcRdYCAAAAEVzcGHDsW9scRiGcRllLg==	2015-10-10 06:16:21+02
:1:count-counter-nl	gAJVBDIzMDBxAS4=	2015-10-10 06:11:41+02
:1:count-counter-be	gAJVBDQzOTVxAS4=	2015-10-10 06:11:42+02
:1:count-counter-pt	gAJVBDE4MDFxAS4=	2015-10-10 06:11:42+02
:1:count-counter-it	gAJVBDM3OTZxAS4=	2015-10-10 06:11:42+02
:1:count-counter-uk	gAJVBDYxMjlxAS4=	2015-10-10 06:11:42+02
:1:count-counter-se	gAJVBDIzMDBxAS4=	2015-10-10 06:11:42+02
:1:count-counter-de	gAJVAzE1NHEBLg==	2015-10-10 06:11:42+02
:1:count-counter-at	gAJVAzMwM3EBLg==	2015-10-10 06:11:42+02
:1:count-counter-ch	gAJVAjgwcQEu	2015-10-10 06:11:43+02
:1:count-counter-fr	gAJVBDY2OTVxAS4=	2015-10-10 06:11:43+02
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	migration history	south	migrationhistory
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	message	auth	message
6	content type	contenttypes	contenttype
7	session	sessions	session
8	site	sites	site
9	log entry	admin	logentry
10	registration profile	registration	registrationprofile
11	key	loginurl	key
12	kv store	thumbnail	kvstore
13	placeholder	cms	placeholder
14	cms plugin	cms	cmsplugin
15	page	cms	page
16	PageModerator	cms	pagemoderator
17	Page moderator state	cms	pagemoderatorstate
18	Page global permission	cms	globalpagepermission
19	Page permission	cms	pagepermission
20	User (page)	cms	pageuser
21	User group (page)	cms	pageusergroup
22	title	cms	title
23	picture	picture	picture
24	text	text	text
25	Snippet	snippet	snippet
26	Snippet	snippet	snippetptr
27	link	link	link
28	file	file	file
29	survey id code	survey	surveyidcode
30	survey user	survey	surveyuser
31	survey	survey	survey
32	participation	survey	participation
33	response send queue	survey	responsesendqueue
34	profile send queue	survey	profilesendqueue
35	local response	survey	localresponse
36	profile	survey	profile
37	last response	survey	lastresponse
38	local profile	survey	localprofile
39	local flu survey	survey	localflusurvey
40	user reminder info	reminder	userreminderinfo
41	reminder settings	reminder	remindersettings
42	news letter template translation	reminder	newslettertemplatetranslation
43	news letter template	reminder	newslettertemplate
44	news letter translation	reminder	newslettertranslation
45	news letter	reminder	newsletter
46	reminder error	reminder	remindererror
47	category translation	journal	categorytranslation
48	Category	journal	category
49	entry translation	journal	entrytranslation
50	Entry	journal	entry
51	latest entry plugin	journal	latestentryplugin
52	Site settings	partnersites	sitesettings
53	cache key	menus	cachekey
54	survey	pollster	survey
55	rule type	pollster	ruletype
56	question data type	pollster	questiondatatype
57	virtual option type	pollster	virtualoptiontype
58	question	pollster	question
59	question row	pollster	questionrow
60	question column	pollster	questioncolumn
61	option	pollster	option
62	rule	pollster	rule
63	Translation	pollster	translationsurvey
64	translation question	pollster	translationquestion
65	translation question row	pollster	translationquestionrow
66	translation question column	pollster	translationquestioncolumn
67	translation option	pollster	translationoption
68	chart type	pollster	charttype
69	chart	pollster	chart
70	survey chart plugin	pollster	surveychartplugin
71	contest plugin	contest	contestplugin
72	prediction	contest	prediction
73	week	contest	week
74	captcha store	captcha	captchastore
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('django_content_type_id_seq', 82, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
30ee0ac821075e08b40d6030abee1e69	YmYwOWQ3NjNlYmY5NjY0OWRjNzkzZjMzZjhiNzUxNDU3MjE3YTdhODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2015-10-10 07:29:27.389778+02
a40f9b67793950951a3a67f2253d4da7	Mzg3OTg3Y2I5YzgxYzUxNDVmOTA3YjFkYmY4YTI0ODkyZWRhZTBkZTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWRLAVUPZGphbmdvX2xhbmd1YWdlWAcAAABTdmVuc2thcQJVEl9hdXRoX3VzZXJfYmFja2Vu\nZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmR1Lg==\n	2015-10-09 16:35:06.533365+02
d608c0cc2ac7593b4a5957818e5a029b	YzRlMGE4ZDA2OTE5MjRlMzJhOTFjZmFjODczYTcwNDZiMDkzNjViYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVD2Rq\nYW5nb19sYW5ndWFnZVgHAAAAU3ZlbnNrYXECVQ1fYXV0aF91c2VyX2lkSwF1Lg==\n	2015-10-10 08:11:47.647584+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: journal_category; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY journal_category (id, slug) FROM stdin;
\.


--
-- Name: journal_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('journal_category_id_seq', 1, false);


--
-- Data for Name: journal_categorytranslation; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY journal_categorytranslation (id, title, language_code, master_id) FROM stdin;
\.


--
-- Name: journal_categorytranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('journal_categorytranslation_id_seq', 1, false);


--
-- Data for Name: journal_entry; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY journal_entry (id, slug, is_published, pub_date, created, updated, category_id, image, alignment) FROM stdin;
\.


--
-- Name: journal_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('journal_entry_id_seq', 1, false);


--
-- Data for Name: journal_entrytranslation; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY journal_entrytranslation (id, title, excerpt, content, language_code, master_id) FROM stdin;
\.


--
-- Name: journal_entrytranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('journal_entrytranslation_id_seq', 1, false);


--
-- Data for Name: journal_latestentryplugin_category; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY journal_latestentryplugin_category (id, latestentryplugin_id, category_id) FROM stdin;
\.


--
-- Name: journal_latestentryplugin_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('journal_latestentryplugin_category_id_seq', 1, false);


--
-- Data for Name: loginurl_key; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY loginurl_key (id, user_id, key, created, usage_left, expires, next) FROM stdin;
\.


--
-- Name: loginurl_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('loginurl_key_id_seq', 1, false);


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
1	sv	1	cms-menu_nodes_sv_1
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 1, true);


--
-- Data for Name: partnersites_sitesettings; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY partnersites_sitesettings (id, site_id, light_color, logo, footer, contact_form_recipient) FROM stdin;
1	1	ce2626	uploads/ladda_ned.jpg		webdev@grotegriepmeting.nl
\.


--
-- Name: partnersites_sitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('partnersites_sitesettings_id_seq', 1, true);


--
-- Data for Name: pollster_chart; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_chart (id, survey_id, type_id, shortname, chartwrapper, sqlfilter, sqlsource, created, updated, status, geotable) FROM stdin;
\.


--
-- Name: pollster_chart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_chart_id_seq', 1, false);


--
-- Data for Name: pollster_charttype; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_charttype (id, shortname, description) FROM stdin;
1	google-charts	Google Chart
3	google-map-centered	Google Map (centered on user)
2	google-map	Google Map
\.


--
-- Name: pollster_charttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_charttype_id_seq', 3, true);


--
-- Data for Name: pollster_option; Type: TABLE DATA; Schema: public; Owner: epiwork
--

INSERT INTO pollster_option VALUES (1, 2, NULL, NULL, NULL, false, false, false, 1, 'Male', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (2, 2, NULL, NULL, NULL, false, false, false, 2, 'Female', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (3, 4, NULL, NULL, NULL, true, false, false, 1, '', '', '', 5, '50', '15', '', '');
INSERT INTO pollster_option VALUES (4, 4, NULL, NULL, NULL, true, false, false, 2, '', '', '', 5, '0', '16', '', '');
INSERT INTO pollster_option VALUES (5, 4, NULL, NULL, NULL, true, false, false, 3, '', '', '', 5, '99', '16', '', '');
INSERT INTO pollster_option VALUES (6, 4, NULL, NULL, NULL, true, false, false, 4, '', '', '', 5, '16', '0', '', '');
INSERT INTO pollster_option VALUES (7, 5, NULL, NULL, NULL, false, false, false, 1, '1 person', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (8, 5, NULL, NULL, NULL, false, false, false, 2, '2 people', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (9, 5, NULL, NULL, NULL, false, false, false, 3, '3 people', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (10, 5, NULL, NULL, NULL, false, false, false, 4, '4 people', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (11, 5, NULL, NULL, NULL, false, false, false, 5, '5 people or more', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (12, 5, NULL, NULL, NULL, false, false, false, 6, 'I don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (13, 6, NULL, NULL, NULL, false, false, false, 1, '1 person', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (14, 6, NULL, NULL, NULL, false, false, false, 2, '2 people', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (15, 6, NULL, NULL, NULL, false, false, false, 3, '3 people', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (16, 6, NULL, NULL, NULL, false, false, false, 4, '4 people', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (17, 6, NULL, NULL, NULL, false, false, false, 5, '5 people or more', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (18, 6, NULL, NULL, NULL, false, false, false, 6, 'I don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (19, 7, NULL, NULL, NULL, false, false, false, 1, '0 children', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (20, 7, NULL, NULL, NULL, false, false, false, 2, '1 child', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (21, 7, NULL, NULL, NULL, false, false, false, 3, '2 children', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (22, 7, NULL, NULL, NULL, false, false, false, 4, '3 children', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (23, 7, NULL, NULL, NULL, false, false, false, 5, '4 or more children', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (24, 7, NULL, NULL, NULL, false, false, false, 6, 'I don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (25, 8, NULL, NULL, NULL, false, false, false, 1, '0 children', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (26, 8, NULL, NULL, NULL, false, false, false, 2, '1 child', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (27, 8, NULL, NULL, NULL, false, false, false, 3, '2 children', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (28, 8, NULL, NULL, NULL, false, false, false, 4, '3 children', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (29, 8, NULL, NULL, NULL, false, false, false, 5, '4 or more children', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (30, 8, NULL, NULL, NULL, false, false, false, 6, 'I don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (31, 9, NULL, NULL, NULL, false, false, false, 1, 'Myself', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (32, 9, NULL, NULL, NULL, false, false, false, 2, 'A member of my household', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (33, 9, NULL, NULL, NULL, false, false, false, 3, 'Someone else', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (34, 10, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (35, 11, NULL, NULL, NULL, false, false, false, 1, 'I have no formal qualification', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (36, 11, NULL, NULL, NULL, false, false, false, 2, 'Primary school 2 (SWE ONLY)', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (37, 11, NULL, NULL, NULL, false, false, false, 3, 'Secondary cat 2 (SWE ONLY)', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (38, 11, NULL, NULL, NULL, false, false, false, 4, 'GCSE''s, levels, CSEs or equivalent', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (39, 11, NULL, NULL, NULL, false, false, false, 5, 'A-levels or equivalent (e.g. Higher, NVQ Level3, BTEC)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (40, 11, NULL, NULL, NULL, false, false, false, 6, 'Batchelors Degree (BA, BSc) or equivalent', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (41, 11, NULL, NULL, NULL, false, false, false, 7, 'Higher Degree or equivalent (e.g. Masters Degree, PGCE, PhD, Medical Doctorate, Advanced Professional Award)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (42, 11, NULL, NULL, NULL, false, false, false, 8, 'Other post-secondary (SWE ONLY)', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (43, 11, NULL, NULL, NULL, false, false, true, 9, 'I am still in education', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (44, 11, NULL, NULL, NULL, false, false, false, 10, 'Don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (45, 12, NULL, NULL, NULL, false, false, false, 1, 'I have no formal qualification', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (46, 12, NULL, NULL, NULL, false, false, false, 2, 'Primary school 2 (SWE ONLY)', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (47, 12, NULL, NULL, NULL, false, false, false, 3, 'Secondary cat 2 (SWE ONLY)', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (48, 12, NULL, NULL, NULL, false, false, false, 4, 'GCSE''s, levels, CSEs or equivalent', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (49, 12, NULL, NULL, NULL, false, false, false, 5, 'A-levels or equivalent (e.g. Higher, NVQ Level3, BTEC)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (50, 12, NULL, NULL, NULL, false, false, false, 6, 'Batchelors Degree (BA, BSc) or equivalent', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (51, 12, NULL, NULL, NULL, false, false, false, 7, 'Higher Degree or equivalent (e.g. Masters Degree, PGCE, PhD, Medical Doctorate, Advanced Professional Award)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (52, 12, NULL, NULL, NULL, false, false, false, 8, 'Other post-secondary (SWE ONLY)', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (53, 12, NULL, NULL, NULL, false, false, true, 9, 'I am still in education', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (54, 12, NULL, NULL, NULL, false, false, false, 10, 'Don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (55, 13, NULL, NULL, NULL, false, false, false, 1, 'Paid employment, full time', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (56, 13, NULL, NULL, NULL, false, false, true, 2, 'Paid employment, part time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (57, 13, NULL, NULL, NULL, false, false, false, 3, 'Self-employed (businessman, farmer, tradesman, etc.)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (58, 13, NULL, NULL, NULL, false, false, false, 4, 'Attending daycare/school/college/university', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (59, 13, NULL, NULL, NULL, false, false, false, 5, 'Home-maker (e.g. housewife)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (60, 13, NULL, NULL, NULL, false, false, false, 6, 'Unemployed', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (61, 13, NULL, NULL, NULL, false, false, false, 7, 'Retired', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (62, 13, NULL, NULL, NULL, false, false, false, 8, 'Parental leave (SWE ONLY)', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (63, 13, NULL, NULL, NULL, false, false, false, 9, 'Long-term sick-leave or parental leave', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (64, 13, NULL, NULL, NULL, false, false, false, 10, 'Other', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (65, 13, NULL, NULL, NULL, false, false, false, 11, 'Don''t want to answer', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (66, 14, NULL, NULL, NULL, false, false, false, 1, 'Paid employment, full time', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (67, 14, NULL, NULL, NULL, false, false, true, 2, 'Paid employment, part time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (68, 14, NULL, NULL, NULL, false, false, false, 3, 'Self-employed (businessman, farmer, tradesman, etc.)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (69, 14, NULL, NULL, NULL, false, false, false, 4, 'Attending daycare/school/college/university', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (70, 14, NULL, NULL, NULL, false, false, false, 5, 'Home-maker (e.g. housewife)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (71, 14, NULL, NULL, NULL, false, false, false, 6, 'Unemployed', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (72, 14, NULL, NULL, NULL, false, false, false, 7, 'Retired', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (73, 14, NULL, NULL, NULL, false, false, false, 8, 'Parental leave (SWE ONLY)', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (74, 14, NULL, NULL, NULL, false, false, false, 9, 'Long-term sick-leave or parental leave', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (75, 14, NULL, NULL, NULL, false, false, false, 10, 'Other', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (76, 14, NULL, NULL, NULL, false, false, false, 11, 'Don''t want to answer', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (77, 15, NULL, NULL, NULL, false, false, false, 1, 'Management', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (78, 15, NULL, NULL, NULL, false, false, false, 2, 'Professional (e.g. manager, doctor, teacher, nurse, engineer)', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (79, 15, NULL, NULL, NULL, false, false, true, 3, 'Retail, sales, catering and hospitality and leisure (e.g. shop assistant, waiter, bar-staff, gym instructor etc)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (80, 15, NULL, NULL, NULL, false, false, false, 4, 'Work that requires some post-secondary training.', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (81, 15, NULL, NULL, NULL, false, false, false, 5, 'Office work (e.g. admin, finance assistant, receptionist etc.)', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (82, 15, NULL, NULL, NULL, false, false, false, 6, 'Service and sales', '', '11', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (83, 15, NULL, NULL, NULL, false, false, false, 7, 'Skilled manual worker (e.g. mechanic, electrician, technician)', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (84, 15, NULL, NULL, NULL, false, false, false, 8, 'Skilled manual cat2 (SWE ONLY)', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (85, 15, NULL, NULL, NULL, false, false, false, 9, 'Skilled manual cat3 (SWE ONLY)', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (86, 15, NULL, NULL, NULL, false, false, false, 10, 'Other manual work (e.g. cleaning, seciruty, driver etc)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (87, 15, NULL, NULL, NULL, false, false, false, 11, 'Military', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (88, 15, NULL, NULL, NULL, false, false, true, 12, 'Other', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (89, 15, NULL, NULL, NULL, false, false, false, 13, 'Don''t want to answer', '', '12', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (90, 16, NULL, NULL, NULL, false, false, false, 1, 'Management', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (91, 16, NULL, NULL, NULL, false, false, false, 2, 'Professional (e.g. manager, doctor, teacher, nurse, engineer)', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (92, 16, NULL, NULL, NULL, false, false, true, 3, 'Retail, sales, catering and hospitality and leisure (e.g. shop assistant, waiter, bar-staff, gym instructor etc)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (93, 16, NULL, NULL, NULL, false, false, false, 4, 'Work that requires some post-secondary training.', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (94, 16, NULL, NULL, NULL, false, false, false, 5, 'Office work (e.g. admin, finance assistant, receptionist etc.)', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (95, 16, NULL, NULL, NULL, false, false, false, 6, 'Service and sales', '', '11', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (96, 16, NULL, NULL, NULL, false, false, false, 7, 'Skilled manual worker (e.g. mechanic, electrician, technician)', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (97, 16, NULL, NULL, NULL, false, false, false, 8, 'Skilled manual cat2 (SWE ONLY)', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (98, 16, NULL, NULL, NULL, false, false, false, 9, 'Skilled manual cat3 (SWE ONLY)', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (99, 16, NULL, NULL, NULL, false, false, false, 10, 'Other manual work (e.g. cleaning, seciruty, driver etc)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (100, 16, NULL, NULL, NULL, false, false, false, 11, 'Military', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (101, 16, NULL, NULL, NULL, false, false, true, 12, 'Other', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (102, 16, NULL, NULL, NULL, false, false, false, 13, 'Don''t want to answer', '', '12', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (103, 17, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (104, 17, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (105, 17, NULL, NULL, NULL, false, false, false, 3, 'Don''t want to answer', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (106, 18, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (107, 18, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (108, 18, NULL, NULL, NULL, false, false, false, 3, 'Don''t want to answer', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (109, 19, NULL, NULL, NULL, false, false, false, 1, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (110, 19, NULL, NULL, NULL, false, false, false, 2, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (111, 20, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (112, 21, NULL, NULL, NULL, false, false, false, 1, 'I have no formal qualification', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (113, 21, NULL, NULL, NULL, false, false, false, 2, 'Primary school 2 (SWE ONLY)', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (114, 21, NULL, NULL, NULL, false, false, false, 3, 'Secondary cat 2 (SWE ONLY)', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (115, 21, NULL, NULL, NULL, false, false, false, 4, 'GCSE''s, levels, CSEs or equivalent', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (116, 21, NULL, NULL, NULL, false, false, false, 5, 'A-levels or equivalent (e.g. Higher, NVQ Level3, BTEC)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (117, 21, NULL, NULL, NULL, false, false, false, 6, 'Batchelors Degree (BA, BSc) or equivalent', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (118, 21, NULL, NULL, NULL, false, false, false, 7, 'Higher Degree or equivalent (e.g. Masters Degree, PGCE, PhD, Medical Doctorate, Advanced Professional Award)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (119, 21, NULL, NULL, NULL, false, false, false, 8, 'Other post-secondary (SWE ONLY)', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (120, 21, NULL, NULL, NULL, false, false, true, 9, 'I am still in education', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (121, 21, NULL, NULL, NULL, false, false, false, 10, 'Don''t want to answer', '', '99', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (122, 22, NULL, NULL, NULL, false, false, false, 1, 'Paid employment, full time', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (123, 22, NULL, NULL, NULL, false, false, true, 2, 'Paid employment, part time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (124, 22, NULL, NULL, NULL, false, false, false, 3, 'Self-employed (businessman, farmer, tradesman, etc.)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (125, 22, NULL, NULL, NULL, false, false, false, 4, 'Attending daycare/school/college/university', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (126, 22, NULL, NULL, NULL, false, false, false, 5, 'Home-maker (e.g. housewife)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (127, 22, NULL, NULL, NULL, false, false, false, 6, 'Unemployed', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (128, 22, NULL, NULL, NULL, false, false, false, 7, 'Retired', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (129, 22, NULL, NULL, NULL, false, false, false, 8, 'Parental leave (SWE ONLY)', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (130, 22, NULL, NULL, NULL, false, false, false, 9, 'Long-term sick-leave or parental leave', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (131, 22, NULL, NULL, NULL, false, false, false, 10, 'Other', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (132, 22, NULL, NULL, NULL, false, false, false, 11, 'Don''t want to answer', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (133, 23, NULL, NULL, NULL, false, false, false, 1, 'Management', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (134, 23, NULL, NULL, NULL, false, false, false, 2, 'Professional (e.g. manager, doctor, teacher, nurse, engineer)', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (135, 23, NULL, NULL, NULL, false, false, true, 3, 'Retail, sales, catering and hospitality and leisure (e.g. shop assistant, waiter, bar-staff, gym instructor etc)', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (136, 23, NULL, NULL, NULL, false, false, false, 4, 'Work that requires some post-secondary training.', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (137, 23, NULL, NULL, NULL, false, false, false, 5, 'Office work (e.g. admin, finance assistant, receptionist etc.)', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (138, 23, NULL, NULL, NULL, false, false, false, 6, 'Service and sales', '', '11', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (139, 23, NULL, NULL, NULL, false, false, false, 7, 'Skilled manual worker (e.g. mechanic, electrician, technician)', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (140, 23, NULL, NULL, NULL, false, false, false, 8, 'Skilled manual cat2 (SWE ONLY)', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (141, 23, NULL, NULL, NULL, false, false, false, 9, 'Skilled manual cat3 (SWE ONLY)', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (142, 23, NULL, NULL, NULL, false, false, false, 10, 'Other manual work (e.g. cleaning, seciruty, driver etc)', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (143, 23, NULL, NULL, NULL, false, false, false, 11, 'Military', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (144, 23, NULL, NULL, NULL, false, false, true, 12, 'Other', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (145, 23, NULL, NULL, NULL, false, false, false, 13, 'Don''t want to answer', '', '12', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (146, 24, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (147, 24, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (148, 24, NULL, NULL, NULL, false, false, false, 3, 'Don''t want to answer', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (149, 26, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (150, 27, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (151, 28, NULL, NULL, NULL, false, false, false, 1, 'answer0', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (152, 28, NULL, NULL, NULL, false, false, false, 2, 'answer1', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (153, 28, NULL, NULL, NULL, false, false, false, 3, 'answer2', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (154, 28, NULL, NULL, NULL, false, false, false, 4, 'answer3', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (155, 28, NULL, NULL, NULL, false, false, false, 5, 'answer4', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (156, 28, NULL, NULL, NULL, false, false, false, 6, 'answer5', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (157, 29, NULL, NULL, NULL, false, false, false, 1, 'answer0', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (158, 29, NULL, NULL, NULL, false, false, false, 2, 'answer1', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (159, 29, NULL, NULL, NULL, false, false, false, 3, 'answer2', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (160, 29, NULL, NULL, NULL, false, false, false, 4, 'answer3', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (161, 29, NULL, NULL, NULL, false, false, false, 5, 'answer4', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (162, 29, NULL, NULL, NULL, false, false, false, 6, 'answer5', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (163, 30, NULL, NULL, NULL, false, false, false, 1, 'answer0', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (164, 30, NULL, NULL, NULL, false, false, false, 2, 'answer1', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (165, 30, NULL, NULL, NULL, false, false, false, 3, 'answer2', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (166, 30, NULL, NULL, NULL, false, false, false, 4, 'answer3', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (167, 30, NULL, NULL, NULL, false, false, false, 5, 'answer4', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (168, 30, NULL, NULL, NULL, false, false, false, 6, 'answer5', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (169, 31, NULL, NULL, NULL, false, false, false, 1, 'answer0', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (170, 31, NULL, NULL, NULL, false, false, false, 2, 'answer1', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (171, 31, NULL, NULL, NULL, false, false, false, 3, 'answer2', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (172, 31, NULL, NULL, NULL, false, false, false, 4, 'answer3', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (173, 31, NULL, NULL, NULL, false, false, false, 5, 'answer4', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (174, 31, NULL, NULL, NULL, false, false, false, 6, 'answer5', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (175, 33, NULL, NULL, NULL, true, false, false, 1, '', '', '', 5, '16', '0', '', '');
INSERT INTO pollster_option VALUES (176, 33, NULL, NULL, NULL, true, false, false, 2, '', '', '', 5, '99', '16', '', '');
INSERT INTO pollster_option VALUES (177, 34, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (178, 35, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (179, 35, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (180, 36, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (181, 36, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (182, 37, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (183, 37, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (184, 37, NULL, NULL, NULL, false, false, true, 3, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (185, 38, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (186, 38, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (187, 38, NULL, NULL, NULL, false, false, true, 3, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (188, 40, NULL, NULL, NULL, false, false, true, 1, 'No symptoms', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (189, 40, NULL, NULL, NULL, false, false, false, 2, 'Fever', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (190, 40, NULL, NULL, NULL, false, false, false, 3, 'Chills', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (191, 40, NULL, NULL, NULL, false, false, true, 4, 'Sneezing', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (192, 40, NULL, NULL, NULL, false, false, false, 5, 'Sore thoat', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (193, 40, NULL, NULL, NULL, false, false, false, 6, 'Runny nose', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (194, 40, NULL, NULL, NULL, false, false, false, 7, 'Cough', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (195, 40, NULL, NULL, NULL, false, false, true, 8, 'Coloured sputum/phlegm', '', '13', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (196, 40, NULL, NULL, NULL, false, false, false, 9, 'Shortness of breath/Difficulty breathing', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (197, 40, NULL, NULL, NULL, false, false, true, 10, 'Chest pain', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (198, 40, NULL, NULL, NULL, false, false, false, 11, 'Feeling tired or exhausted', '', '11', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (199, 40, NULL, NULL, NULL, false, false, false, 12, 'Muscle/join pain', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (200, 40, NULL, NULL, NULL, false, false, false, 13, 'Headache', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (201, 40, NULL, NULL, NULL, false, false, true, 14, 'Loss of appetite', '', '12', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (202, 40, NULL, NULL, NULL, false, false, true, 15, 'Watery, bloodshot eyes', '', '14', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (203, 40, NULL, NULL, NULL, false, false, false, 16, 'Stomach ache', '', '18', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (204, 40, NULL, NULL, NULL, false, false, false, 17, 'Abdominal cramps', '', '22', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (205, 40, NULL, NULL, NULL, false, false, false, 18, 'Nausea', '', '15', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (206, 40, NULL, NULL, NULL, false, false, false, 19, 'Vomiting', '', '16', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (207, 40, NULL, NULL, NULL, false, false, false, 20, 'Diarrhoea', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (208, 40, NULL, NULL, NULL, false, false, false, 21, 'Mucus in stool', '', '20', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (209, 40, NULL, NULL, NULL, false, false, false, 22, 'Blood in stool', '', '21', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (210, 40, NULL, NULL, NULL, false, false, false, 23, 'Other', '', '19', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (211, 41, NULL, NULL, NULL, false, false, true, 1, 'No symptoms', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (212, 41, NULL, NULL, NULL, false, false, false, 2, 'Fever', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (213, 41, NULL, NULL, NULL, false, false, false, 3, 'Chills', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (214, 41, NULL, NULL, NULL, false, false, true, 4, 'Sneezing', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (215, 41, NULL, NULL, NULL, false, false, false, 5, 'Sore thoat', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (216, 41, NULL, NULL, NULL, false, false, false, 6, 'Runny nose', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (217, 41, NULL, NULL, NULL, false, false, false, 7, 'Cough', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (218, 41, NULL, NULL, NULL, false, false, true, 8, 'Coloured sputum/phlegm', '', '13', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (219, 41, NULL, NULL, NULL, false, false, false, 9, 'Shortness of breath/Difficulty breathing', '', '7', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (220, 41, NULL, NULL, NULL, false, false, true, 10, 'Chest pain', '', '10', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (221, 41, NULL, NULL, NULL, false, false, false, 11, 'Feeling tired or exhausted', '', '11', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (222, 41, NULL, NULL, NULL, false, false, false, 12, 'Muscle/join pain', '', '9', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (223, 41, NULL, NULL, NULL, false, false, false, 13, 'Headache', '', '8', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (224, 41, NULL, NULL, NULL, false, false, true, 14, 'Loss of appetite', '', '12', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (225, 41, NULL, NULL, NULL, false, false, true, 15, 'Watery, bloodshot eyes', '', '14', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (226, 41, NULL, NULL, NULL, false, false, false, 16, 'Stomach ache', '', '18', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (227, 41, NULL, NULL, NULL, false, false, false, 17, 'Abdominal cramps', '', '22', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (228, 41, NULL, NULL, NULL, false, false, false, 18, 'Nausea', '', '15', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (229, 41, NULL, NULL, NULL, false, false, false, 19, 'Vomiting', '', '16', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (230, 41, NULL, NULL, NULL, false, false, false, 20, 'Diarrhoea', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (231, 41, NULL, NULL, NULL, false, false, false, 21, 'Mucus in stool', '', '20', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (232, 41, NULL, NULL, NULL, false, false, false, 22, 'Blood in stool', '', '21', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (233, 41, NULL, NULL, NULL, false, false, false, 23, 'Other', '', '19', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (234, 42, NULL, NULL, NULL, false, false, false, 1, 'Yes', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (235, 42, NULL, NULL, NULL, false, false, false, 2, 'No', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (236, 42, NULL, NULL, NULL, false, false, false, 3, 'I don''t know/can''t remember', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (237, 43, NULL, NULL, NULL, false, false, false, 1, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (238, 43, NULL, NULL, NULL, false, false, false, 2, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (239, 43, NULL, NULL, NULL, false, false, false, 3, 'I don''t know', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (240, 43, NULL, NULL, NULL, false, false, true, 4, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (241, 44, NULL, NULL, NULL, false, false, false, 1, 'Yes', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (242, 44, NULL, NULL, NULL, false, false, false, 2, 'No', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (243, 44, NULL, NULL, NULL, false, false, false, 3, 'I don''t know', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (244, 44, NULL, NULL, NULL, false, false, true, 4, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (245, 45, NULL, NULL, NULL, false, false, true, 1, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (246, 45, NULL, NULL, NULL, false, false, false, 2, '1 time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (247, 45, NULL, NULL, NULL, false, false, false, 3, '2 times', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (248, 45, NULL, NULL, NULL, false, false, false, 4, '3 times', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (249, 45, NULL, NULL, NULL, false, false, false, 5, '4 or 5 times', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (250, 45, NULL, NULL, NULL, false, false, false, 6, '6 or more times', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (251, 46, NULL, NULL, NULL, false, false, true, 1, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (252, 46, NULL, NULL, NULL, false, false, false, 2, '1 time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (253, 46, NULL, NULL, NULL, false, false, false, 3, '2 times', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (254, 46, NULL, NULL, NULL, false, false, false, 4, '3 times', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (255, 46, NULL, NULL, NULL, false, false, false, 5, '4 or 5 times', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (256, 46, NULL, NULL, NULL, false, false, false, 6, '6 or more times', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (257, 47, NULL, NULL, NULL, false, false, true, 1, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (258, 47, NULL, NULL, NULL, false, false, false, 2, '1 time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (259, 47, NULL, NULL, NULL, false, false, false, 3, '2 times', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (260, 47, NULL, NULL, NULL, false, false, false, 4, '3 times', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (261, 47, NULL, NULL, NULL, false, false, false, 5, '4 or 5 times', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (262, 47, NULL, NULL, NULL, false, false, false, 6, '6 or more times', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (263, 48, NULL, NULL, NULL, false, false, true, 1, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (264, 48, NULL, NULL, NULL, false, false, false, 2, '1 time', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (265, 48, NULL, NULL, NULL, false, false, false, 3, '2 times', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (266, 48, NULL, NULL, NULL, false, false, false, 4, '3 times', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (267, 48, NULL, NULL, NULL, false, false, false, 5, '4 or 5 times', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (268, 48, NULL, NULL, NULL, false, false, false, 6, '6 or more times', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (269, 49, NULL, NULL, NULL, false, true, false, 1, 'Choose date', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (270, 49, NULL, NULL, NULL, false, false, true, 2, 'I don''t know/can''t remember', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (271, 49, NULL, NULL, NULL, false, false, true, 3, 'NullAns', '', '17', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (272, 50, NULL, NULL, NULL, false, false, false, 1, 'Flu or flu-like illness', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (273, 50, NULL, NULL, NULL, false, false, false, 2, 'Common cold', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (274, 50, NULL, NULL, NULL, false, false, false, 3, 'Allergy/hay fever', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (275, 50, NULL, NULL, NULL, false, false, false, 4, 'Asthma', '', '6', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (276, 50, NULL, NULL, NULL, false, false, false, 5, 'Gastroenteritis/gastric flu', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (277, 50, NULL, NULL, NULL, false, false, false, 6, 'Other', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (278, 50, NULL, NULL, NULL, false, false, false, 7, 'I don''t know', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (279, 52, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (280, 53, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (281, 54, NULL, NULL, NULL, false, false, true, 1, 'Null', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (282, 55, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (283, 55, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (284, 56, NULL, NULL, NULL, false, false, false, 1, 'No', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (285, 56, NULL, NULL, NULL, false, false, false, 2, 'Yes', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (286, 57, NULL, NULL, NULL, false, false, false, 1, 'answer', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (287, 57, NULL, NULL, NULL, false, false, false, 2, 'answer', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (288, 57, NULL, NULL, NULL, false, false, false, 3, 'answer', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (289, 57, NULL, NULL, NULL, false, false, false, 4, 'answer', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (290, 57, NULL, NULL, NULL, false, false, false, 5, 'answer', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (291, 57, NULL, NULL, NULL, false, false, false, 6, 'answer', '', '5', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (292, 58, NULL, NULL, NULL, false, false, false, 1, 'answer', '', '0', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (293, 58, NULL, NULL, NULL, false, false, false, 2, 'answer', '', '1', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (294, 58, NULL, NULL, NULL, false, false, false, 3, 'answer', '', '2', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (295, 58, NULL, NULL, NULL, false, false, false, 4, 'answer', '', '3', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (296, 58, NULL, NULL, NULL, false, false, false, 5, 'answer', '', '4', NULL, '', '', '', '');
INSERT INTO pollster_option VALUES (297, 58, NULL, NULL, NULL, false, false, false, 6, 'answer', '', '5', NULL, '', '', '', '');



--
-- Name: pollster_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_option_id_seq', 297, true);


--
-- Data for Name: pollster_question; Type: TABLE DATA; Schema: public; Owner: epiwork
--


INSERT INTO pollster_question VALUES (1, 1, false, false, 1, 'Compilation Date', '', 'builtin', 6, NULL, 'timestamp', '', '', '', '');
INSERT INTO pollster_question VALUES (2, 1, false, true, 2, 'What is your gender?', '', 'single-choice', 3, NULL, 'Q1', '', '', '', '');
INSERT INTO pollster_question VALUES (3, 1, false, true, 3, 'What is the first part of your home postal code?', '', 'text', 1, NULL, 'Q3', '', '', '', 'Hoppsan! Postnumret får bara vara 5 siffror långt och får inte innehålla mellanslag eller bindesstreck!');
INSERT INTO pollster_question VALUES (4, 1, true, true, 4, 'What is your date of birth?', '', 'text', 5, NULL, 'Q2', '', '', '', '');
INSERT INTO pollster_question VALUES (5, 1, true, false, 5, 'INCLUDING YOU, how many people live in your household?', '', 'single-choice', 2, NULL, 'Q6f', '', '', '', '');
INSERT INTO pollster_question VALUES (6, 1, true, false, 6, 'INCLUDING YOU, how many people live in your household?', '', 'single-choice', 2, NULL, 'Q6ff', '', '', '', '');
INSERT INTO pollster_question VALUES (7, 1, true, false, 7, 'How many children under 7 live in your household?', '', 'single-choice', 2, NULL, 'Q6g', '', '', '', '');
INSERT INTO pollster_question VALUES (8, 1, true, false, 8, 'How many children under 7 live in your child''s household?', '', 'single-choice', 2, NULL, 'Q6gg', '', '', '', '');
INSERT INTO pollster_question VALUES (9, 1, true, false, 9, 'For whom are you filling this survey in?', '', 'single-choice', 3, NULL, 'Q0', '', '', '', '');
INSERT INTO pollster_question VALUES (10, 1, true, false, 10, 'Comment for guardians', '', 'single-choice', 2, NULL, 'Q3hh', '', '', '', '');
INSERT INTO pollster_question VALUES (11, 1, true, false, 11, 'What is the highest level of formal education/qualification that you have?', 'If you are still in education, then please tick this box with the highest level that you have already achieved.', 'single-choice', 3, NULL, 'Q4d', '', '', '', '');
INSERT INTO pollster_question VALUES (12, 1, true, false, 12, 'What is the highest level of formal education/qualification that you have?', 'If you are still in education, then please tick this box with the highest level that you have already achieved.', 'single-choice', 3, NULL, 'Q4d1', '', '', '', '');
INSERT INTO pollster_question VALUES (13, 1, true, false, 13, 'What is your main activity?', '', 'single-choice', 3, NULL, 'Q4', '', '', '', '');
INSERT INTO pollster_question VALUES (14, 1, true, false, 14, 'What is your main activity?', '', 'single-choice', 3, NULL, 'Q4e1', '', '', '', '');
INSERT INTO pollster_question VALUES (15, 1, true, false, 15, 'Which of the following descriptions most closely matches with your main occupation?', '', 'single-choice', 3, NULL, 'Q4c', '', '', '', '');
INSERT INTO pollster_question VALUES (16, 1, true, false, 16, 'Which of the following descriptions most closely matches with your main occupation?', '', 'single-choice', 3, NULL, 'Q4c1', '', '', '', '');
INSERT INTO pollster_question VALUES (17, 1, true, false, 17, 'Do you smoke daily?', '', 'single-choice', 3, NULL, 'Q13', '', '', '', '');
INSERT INTO pollster_question VALUES (18, 1, true, false, 18, 'Do you smoke daily?', '', 'single-choice', 3, NULL, 'Q13e1', '', '', '', '');
INSERT INTO pollster_question VALUES (19, 1, true, false, 19, 'SWEDEN ONLY: Does the child have more than one guardian?', '', 'single-choice', 2, NULL, 'Q7gg', '', '', '', '');
INSERT INTO pollster_question VALUES (20, 1, true, false, 20, 'Comment about second guardian', '', 'single-choice', 2, NULL, 'Q4gg', '', '', '', '');
INSERT INTO pollster_question VALUES (21, 1, true, false, 21, 'What is the highest level of formal education/qualification that you have?', 'If you are still in education, then please tick this box with the highest level that you have already achieved.', 'single-choice', 3, NULL, 'Q4d2', '', '', '', '');
INSERT INTO pollster_question VALUES (22, 1, true, false, 22, 'What is your main activity?', '', 'single-choice', 3, NULL, 'Q4e2', '', '', '', '');
INSERT INTO pollster_question VALUES (23, 1, true, false, 23, 'Which of the following descriptions most closely matches with your main occupation?', '', 'single-choice', 3, NULL, 'Q4c2', '', '', '', '');
INSERT INTO pollster_question VALUES (24, 1, true, false, 24, 'Does guaridan number 2 smoke daily?', '', 'single-choice', 3, NULL, 'Q13e2', '', '', '', '');
INSERT INTO pollster_question VALUES (25, 1, true, false, 25, 'Do you have anything to add?', '', 'text', 2, NULL, 'Q14b', '', '', '', '');
INSERT INTO pollster_question VALUES (26, 1, true, false, 26, 'Thank you', '', 'single-choice', 2, NULL, 'Q14c', '', '', '', '');
INSERT INTO pollster_question VALUES (27, 1, true, false, 27, 'Thank you for updating', '', 'single-choice', 2, NULL, 'Q14d', '', '', '', '');
INSERT INTO pollster_question VALUES (28, 1, true, false, 28, 'Extra question 1', '', 'single-choice', 3, NULL, 'Q18a', '', '', '', '');
INSERT INTO pollster_question VALUES (29, 1, true, false, 29, 'Extra question 2', '', 'single-choice', 3, NULL, 'Q18b', '', '', '', '');
INSERT INTO pollster_question VALUES (30, 1, true, false, 30, 'Extra question 3', '', 'multiple-choice', 3, NULL, 'Q18c', 'check', '', '', '');
INSERT INTO pollster_question VALUES (31, 1, true, false, 31, 'Extra question 4', '', 'multiple-choice', 3, NULL, 'Q18d', 'check', '', '', '');
INSERT INTO pollster_question VALUES (32, 2, false, false, 1, 'Compilation Date', '', 'builtin', 6, NULL, 'timestamp', '', '', '', '');
INSERT INTO pollster_question VALUES (33, 2, true, false, 2, 'Age', '', 'text', 5, NULL, 'Q0', '', '', '', '');
INSERT INTO pollster_question VALUES (34, 2, true, false, 3, 'Thank you for updating!', 'Don''t forget to click "Send"!', 'single-choice', 2, NULL, 'Q6k', '', '', '', '');
INSERT INTO pollster_question VALUES (35, 2, true, false, 4, 'Have you fallen ill during the past seven days?', '', 'single-choice', 3, NULL, 'Q1a', '', '', '', '');
INSERT INTO pollster_question VALUES (36, 2, true, false, 5, 'Has your child fallen ill during the past seven days?', '', 'single-choice', 3, NULL, 'Q1aa', '', '', '', '');
INSERT INTO pollster_question VALUES (37, 2, true, false, 6, 'Had you been overseas / abroad during the 10 days before your symptoms started?', '', 'single-choice', 3, NULL, 'Q1b', '', '', '', '');
INSERT INTO pollster_question VALUES (38, 2, true, false, 7, 'Had your child been overseas / abroad during the 10 days before the symptoms started?', '', 'single-choice', 3, NULL, 'Q1bb', '', '', '', '');
INSERT INTO pollster_question VALUES (39, 2, true, false, 8, 'To which country/countries did you travel?', '', 'text', 2, NULL, 'Q1c', '', '', '', '');
INSERT INTO pollster_question VALUES (40, 2, true, false, 9, 'Which of the following symptoms did you/have you have?', '', 'multiple-choice', 3, NULL, 'Q1', 'check', '', '', '');
INSERT INTO pollster_question VALUES (41, 2, true, false, 10, 'Which of the following symptoms did your child have?', '', 'multiple-choice', 3, NULL, 'Q111', 'check', '', '', '');
INSERT INTO pollster_question VALUES (42, 2, true, false, 11, 'Did the symptoms develop suddenly over a few hours?', 'By suddenly, we mean over a few hours, rather than days.', 'single-choice', 3, NULL, 'Q5', '', '', '', '');
INSERT INTO pollster_question VALUES (43, 2, true, false, 12, 'Was the fever more than 38 degrees Celsius? (If you did not measure your temperature, mark "I don''t know")', '', 'single-choice', 3, NULL, 'Q6d', '', '', '', '');
INSERT INTO pollster_question VALUES (44, 2, true, false, 13, 'Did the fever develop suddenly?', '', 'single-choice', 3, NULL, 'Q6b', '', '', '', '');
INSERT INTO pollster_question VALUES (45, 2, true, false, 14, 'How many times did you vomit on the worst day?', '', 'single-choice', 3, NULL, 'Q6e', '', '', '', '');
INSERT INTO pollster_question VALUES (46, 2, true, false, 15, 'How many times did your child vomit on the worst day?', '', 'single-choice', 3, NULL, 'Q6ee', '', '', '', '');
INSERT INTO pollster_question VALUES (47, 2, true, false, 16, 'How many times did you have diarrhea on the worst day?', '', 'single-choice', 3, NULL, 'Q6f', '', '', '', '');
INSERT INTO pollster_question VALUES (48, 2, true, false, 17, 'How many times did your child have diarrhea on the worst day?', '', 'single-choice', 3, NULL, 'Q6ff', '', '', '', '');
INSERT INTO pollster_question VALUES (49, 2, true, false, 18, 'When did the first symptoms appear?', '', 'single-choice', 3, 4, 'Q3', 'radio', '', '', '');
INSERT INTO pollster_question VALUES (50, 2, true, false, 19, 'What do you think is causing your symptoms?', 'If you are reasonably sure about what is causing your symptoms, please tick the appropriate box. Otherwise, please tick “I don’t know”.', 'single-choice', 3, NULL, 'Q11', '', '', '', '');
INSERT INTO pollster_question VALUES (51, 2, true, false, 20, 'Do you have any comments?', '', 'text', 2, NULL, 'Q6g', '', '', '', '');
INSERT INTO pollster_question VALUES (52, 2, true, false, 21, 'Thank you!', 'Don''t forget to click "Send"!', 'single-choice', 2, NULL, 'Q6h', '', '', '', '');
INSERT INTO pollster_question VALUES (53, 2, true, false, 22, 'Thank you for your null-report!', 'Don''t forget to click "Send"!', 'single-choice', 2, NULL, 'Q6i', '', '', '', '');
INSERT INTO pollster_question VALUES (54, 2, true, false, 23, 'Thank you for your travel-report!', 'Don''t forget to click "Send"!', 'single-choice', 2, NULL, 'Q6j', '', '', '', '');
INSERT INTO pollster_question VALUES (55, 2, true, false, 24, 'Have you had other symptoms during the past 30 days that you forgot to report?', '', 'single-choice', 3, NULL, 'Q1d', '', '', '', '');
INSERT INTO pollster_question VALUES (56, 2, true, false, 25, 'Open new survey for old symptoms...', '', 'single-choice', 3, NULL, 'Q1e', '', '', '', '');
INSERT INTO pollster_question VALUES (57, 2, true, false, 26, 'Example', '', 'multiple-choice', 3, NULL, 'Q14c', 'check', '', '', '');
INSERT INTO pollster_question VALUES (58, 2, true, false, 27, 'Example', '', 'multiple-choice', 3, NULL, 'Q14d', 'check', '', '', '');


--
-- Name: pollster_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_question_id_seq', 58, true);


--
-- Data for Name: pollster_questioncolumn; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_questioncolumn (id, question_id, ordinal, title) FROM stdin;
\.


--
-- Name: pollster_questioncolumn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_questioncolumn_id_seq', 1, false);


--
-- Data for Name: pollster_questiondatatype; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_questiondatatype (id, title, db_type, css_class, js_class) FROM stdin;
1	PostalCode	db.models.PostalCodeField(null=True, blank=True)	postalcode-type	wok.pollster.datatypes.PostalCode
2	Text	django.db.models.TextField(null=True, blank=True)	text-type	wok.pollster.datatypes.Text
3	Numeric	django.db.models.PositiveIntegerField(null=True, blank=True)	numeric-type	wok.pollster.datatypes.Numeric
4	Date	django.db.models.DateField(null=True, blank=True)	date-type	wok.pollster.datatypes.Date
5	YearMonth	db.models.YearMonthField(null=True, blank=True)	monthyear-type	wok.pollster.datatypes.YearMonth
6	Timestamp	django.db.models.DateTimeField(null=True, blank=True)	timestamp-type	wok.pollster.datatypes.Timestamp
\.


--
-- Name: pollster_questiondatatype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_questiondatatype_id_seq', 6, true);


--
-- Data for Name: pollster_questionrow; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_questionrow (id, question_id, ordinal, title) FROM stdin;
\.


--
-- Name: pollster_questionrow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_questionrow_id_seq', 1, false);


--
-- Data for Name: pollster_rule; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_rule (id, rule_type_id, subject_question_id, object_question_id, is_sufficient) FROM stdin;
1	9	2	27	t
2	10	2	26	t
3	8	2	2	t
4	8	3	3	f
5	1	4	8	t
6	1	4	12	t
7	1	4	19	t
8	1	4	14	t
9	1	4	18	t
10	1	4	6	t
11	8	4	4	t
12	1	4	11	t
13	5	4	9	t
14	8	4	4	t
15	1	4	5	t
16	1	4	7	t
17	1	4	25	t
18	1	4	13	t
19	1	4	17	t
20	1	4	10	t
21	8	5	5	t
22	8	6	6	t
23	8	7	7	t
24	8	8	8	t
25	8	9	9	t
26	8	11	11	t
27	8	12	12	t
28	1	13	15	t
29	8	13	13	t
30	8	14	14	t
31	1	14	16	t
32	8	15	15	t
33	8	16	16	t
34	1	17	26	t
35	8	17	17	t
36	8	18	18	t
37	1	19	20	t
38	1	19	21	t
39	1	19	22	t
40	1	19	24	t
41	1	19	26	t
42	8	19	19	t
43	8	21	21	t
44	8	22	22	t
45	1	22	23	t
46	8	23	23	t
47	8	24	24	t
48	8	25	25	t
49	1	25	26	t
50	1	33	36	t
51	8	33	33	t
52	1	33	35	t
53	8	35	35	t
54	6	35	40	t
55	1	35	53	t
56	1	35	37	t
57	9	35	34	t
58	2	35	40	t
59	6	35	37	t
60	1	35	51	t
61	1	36	38	t
62	8	36	36	t
63	1	36	53	t
64	6	36	41	t
65	9	36	34	t
66	2	36	41	t
67	6	36	38	t
68	1	36	51	t
69	1	37	39	t
70	6	37	39	t
71	1	37	40	t
72	1	37	51	t
73	1	37	54	t
74	8	37	37	t
75	1	38	41	t
76	1	38	51	t
77	1	38	54	t
78	8	38	38	t
79	1	38	39	t
80	6	38	39	t
81	8	39	39	t
82	1	40	42	t
83	1	40	52	t
84	1	40	43	f
85	8	40	40	t
86	7	40	40	t
87	1	40	49	t
88	1	40	44	t
89	1	40	51	t
90	1	40	47	t
91	1	40	45	t
92	1	41	48	t
93	1	41	49	t
94	1	41	51	t
95	1	41	52	t
96	7	41	33	t
97	8	41	41	t
98	1	41	42	t
99	1	41	46	t
100	1	41	43	t
101	1	41	44	t
102	8	42	42	t
103	8	43	43	t
104	8	44	44	t
105	8	45	45	t
106	8	46	46	t
107	8	47	47	t
108	8	48	48	t
109	8	49	49	t
110	8	50	50	t
111	8	51	51	t
\.


--
-- Name: pollster_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_rule_id_seq', 111, true);


--
-- Data for Name: pollster_rule_object_options; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_rule_object_options (id, rule_id, option_id) FROM stdin;
1	3	1
2	3	2
3	11	3
4	11	4
5	11	5
6	13	32
7	14	3
8	21	7
9	21	8
10	21	9
11	21	10
12	21	11
13	21	12
14	22	13
15	22	14
16	22	15
17	22	16
18	22	17
19	22	18
20	24	25
21	24	26
22	24	27
23	24	28
24	24	29
25	24	30
26	25	33
27	25	31
28	26	35
29	26	36
30	26	37
31	26	38
32	26	39
33	26	40
34	26	41
35	26	42
36	26	43
37	27	45
38	27	46
39	27	47
40	27	48
41	27	49
42	27	50
43	27	51
44	27	52
45	27	53
46	27	54
47	29	64
48	29	65
49	29	55
50	29	56
51	29	57
52	29	58
53	29	59
54	29	60
55	29	61
56	29	62
57	29	63
58	30	66
59	30	67
60	30	68
61	30	69
62	30	70
63	30	71
64	30	72
65	30	73
66	30	74
67	30	75
68	30	76
69	32	77
70	32	78
71	32	79
72	32	80
73	32	81
74	32	82
75	32	83
76	32	84
77	32	85
78	32	86
79	32	87
80	32	88
81	32	89
82	33	96
83	33	97
84	33	98
85	33	99
86	33	100
87	33	101
88	33	102
89	33	90
90	33	91
91	33	92
92	33	93
93	33	94
94	33	95
95	35	104
96	35	105
97	35	103
98	36	106
99	36	107
100	36	108
101	42	109
102	42	110
103	43	112
104	43	113
105	43	114
106	43	115
107	43	116
108	43	117
109	43	118
110	43	119
111	43	120
112	43	121
113	44	128
114	44	129
115	44	130
116	44	131
117	44	132
118	44	122
119	44	123
120	44	124
121	44	125
122	44	126
123	44	127
124	46	133
125	46	134
126	46	135
127	46	136
128	46	137
129	46	138
130	46	139
131	46	140
132	46	141
133	46	142
134	46	143
135	46	144
136	46	145
137	47	146
138	47	147
139	47	148
140	51	176
141	51	175
142	53	178
143	53	179
144	54	188
145	54	189
146	54	190
147	54	191
148	54	192
149	54	193
150	54	194
151	54	195
152	54	196
153	54	197
154	54	198
155	54	199
156	54	200
157	54	201
158	54	202
159	54	203
160	54	204
161	54	205
162	54	206
163	54	207
164	54	208
165	54	209
166	54	210
167	59	184
168	59	182
169	59	183
170	62	180
171	62	181
172	64	211
173	64	212
174	64	213
175	64	214
176	64	215
177	64	216
178	64	217
179	64	218
180	64	219
181	64	220
182	64	221
183	64	222
184	64	223
185	64	224
186	64	225
187	64	226
188	64	227
189	64	228
190	64	229
191	64	230
192	64	231
193	64	232
194	64	233
195	67	185
196	67	186
197	67	187
198	74	184
199	74	182
200	74	183
201	78	185
202	78	186
203	78	187
204	85	189
205	85	190
206	85	191
207	85	192
208	85	193
209	85	194
210	85	195
211	85	196
212	85	197
213	85	198
214	85	199
215	85	200
216	85	201
217	85	202
218	85	203
219	85	204
220	85	205
221	85	206
222	85	207
223	85	208
224	85	209
225	85	210
226	97	212
227	97	213
228	97	214
229	97	215
230	97	216
231	97	217
232	97	218
233	97	219
234	97	220
235	97	221
236	97	222
237	97	223
238	97	224
239	97	225
240	97	226
241	97	227
242	97	228
243	97	229
244	97	230
245	97	231
246	97	232
247	97	233
248	102	234
249	102	235
250	102	236
251	103	240
252	103	237
253	103	238
254	103	239
255	104	241
256	104	242
257	104	243
258	104	244
259	105	245
260	105	246
261	105	247
262	105	248
263	105	249
264	105	250
265	106	256
266	106	251
267	106	252
268	106	253
269	106	254
270	106	255
271	107	257
272	107	258
273	107	259
274	107	260
275	107	261
276	107	262
277	108	264
278	108	265
279	108	266
280	108	267
281	108	268
282	109	269
283	109	270
284	109	271
285	110	272
286	110	273
287	110	274
288	110	275
289	110	276
290	110	277
291	110	278
\.


--
-- Name: pollster_rule_object_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_rule_object_options_id_seq', 291, true);


--
-- Data for Name: pollster_rule_subject_options; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_rule_subject_options (id, rule_id, option_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
5	3	1
6	3	2
7	5	6
8	6	6
9	7	6
10	8	6
11	9	6
12	10	6
13	11	3
14	11	4
15	11	5
16	12	4
17	13	4
18	14	3
19	15	4
20	16	4
21	17	3
22	17	4
23	17	5
24	17	6
25	18	4
26	19	4
27	20	6
28	21	7
29	21	8
30	21	9
31	21	10
32	21	11
33	21	12
34	22	13
35	22	14
36	22	15
37	22	16
38	22	17
39	22	18
40	23	19
41	23	20
42	23	21
43	23	22
44	23	23
45	23	24
46	24	25
47	24	26
48	24	27
49	24	28
50	24	29
51	24	30
52	25	33
53	25	31
54	26	35
55	26	36
56	26	37
57	26	38
58	26	39
59	26	40
60	26	41
61	26	42
62	26	43
63	27	45
64	27	46
65	27	47
66	27	48
67	27	49
68	27	50
69	27	51
70	27	52
71	27	53
72	27	54
73	28	56
74	28	57
75	28	55
76	29	64
77	29	65
78	29	55
79	29	56
80	29	57
81	29	58
82	29	59
83	29	60
84	29	61
85	29	62
86	29	63
87	30	66
88	30	67
89	30	68
90	30	69
91	30	70
92	30	71
93	30	72
94	30	73
95	30	74
96	30	75
97	30	76
98	31	66
99	31	67
100	31	68
101	32	77
102	32	78
103	32	79
104	32	80
105	32	81
106	32	82
107	32	83
108	32	84
109	32	85
110	32	86
111	32	87
112	32	88
113	32	89
114	33	96
115	33	97
116	33	98
117	33	99
118	33	100
119	33	101
120	33	102
121	33	90
122	33	91
123	33	92
124	33	93
125	33	94
126	33	95
127	34	104
128	34	105
129	34	103
130	35	104
131	35	105
132	35	103
133	36	106
134	36	107
135	36	108
136	37	109
137	38	109
138	39	109
139	40	109
140	41	109
141	41	110
142	42	109
143	42	110
144	43	112
145	43	113
146	43	114
147	43	115
148	43	116
149	43	117
150	43	118
151	43	119
152	43	120
153	43	121
154	44	128
155	44	129
156	44	130
157	44	131
158	44	132
159	44	122
160	44	123
161	44	124
162	44	125
163	44	126
164	44	127
165	45	122
166	45	123
167	45	124
168	46	133
169	46	134
170	46	135
171	46	136
172	46	137
173	46	138
174	46	139
175	46	140
176	46	141
177	46	142
178	46	143
179	46	144
180	46	145
181	47	146
182	47	147
183	47	148
184	50	175
185	51	176
186	51	175
187	52	176
188	53	178
189	53	179
190	54	178
191	55	178
192	56	179
193	57	178
194	57	179
195	58	178
196	59	178
197	60	178
198	61	181
199	62	180
200	62	181
201	63	180
202	64	180
203	65	180
204	65	181
205	66	180
206	67	180
207	68	180
208	69	183
209	70	182
210	71	182
211	71	183
212	72	183
213	73	183
214	74	184
215	74	182
216	74	183
217	75	185
218	75	186
219	76	186
220	77	186
221	78	185
222	78	186
223	78	187
224	79	186
225	80	185
226	82	192
227	82	193
228	82	194
229	82	195
230	82	196
231	82	197
232	82	198
233	82	199
234	82	200
235	82	201
236	82	202
237	82	203
238	82	205
239	82	206
240	82	207
241	82	208
242	82	209
243	82	210
244	82	189
245	82	190
246	82	191
247	83	189
248	83	190
249	83	191
250	83	192
251	83	193
252	83	194
253	83	195
254	83	196
255	83	197
256	83	198
257	83	199
258	83	200
259	83	201
260	83	202
261	83	203
262	83	204
263	83	205
264	83	206
265	83	207
266	83	208
267	83	209
268	83	210
269	84	189
270	85	189
271	85	190
272	85	191
273	85	192
274	85	193
275	85	194
276	85	195
277	85	196
278	85	197
279	85	198
280	85	199
281	85	200
282	85	201
283	85	202
284	85	203
285	85	204
286	85	205
287	85	206
288	85	207
289	85	208
290	85	209
291	85	210
292	86	188
293	87	189
294	87	190
295	87	191
296	87	192
297	87	193
298	87	194
299	87	195
300	87	196
301	87	197
302	87	198
303	87	199
304	87	200
305	87	201
306	87	202
307	87	203
308	87	204
309	87	205
310	87	206
311	87	207
312	87	208
313	87	209
314	87	210
315	88	189
316	89	188
317	89	189
318	89	190
319	89	191
320	89	192
321	89	193
322	89	194
323	89	195
324	89	196
325	89	197
326	89	198
327	89	199
328	89	200
329	89	201
330	89	202
331	89	203
332	89	205
333	89	206
334	89	207
335	89	208
336	89	209
337	89	210
338	90	207
339	91	206
340	92	230
341	93	212
342	93	213
343	93	214
344	93	215
345	93	216
346	93	217
347	93	218
348	93	219
349	93	220
350	93	221
351	93	222
352	93	223
353	93	224
354	93	225
355	93	226
356	93	227
357	93	228
358	93	229
359	93	230
360	93	231
361	93	232
362	93	233
363	94	212
364	94	213
365	94	214
366	94	215
367	94	216
368	94	217
369	94	218
370	94	219
371	94	220
372	94	221
373	94	222
374	94	223
375	94	224
376	94	225
377	94	226
378	94	227
379	94	228
380	94	229
381	94	230
382	94	231
383	94	232
384	94	233
385	95	212
386	95	213
387	95	214
388	95	215
389	95	216
390	95	217
391	95	218
392	95	219
393	95	220
394	95	221
395	95	222
396	95	223
397	95	224
398	95	225
399	95	226
400	95	227
401	95	228
402	95	229
403	95	230
404	95	231
405	95	232
406	95	233
407	96	211
408	97	212
409	97	213
410	97	214
411	97	215
412	97	216
413	97	217
414	97	218
415	97	219
416	97	220
417	97	221
418	97	222
419	97	223
420	97	224
421	97	225
422	97	226
423	97	227
424	97	228
425	97	229
426	97	230
427	97	231
428	97	232
429	97	233
430	98	212
431	98	213
432	98	214
433	98	215
434	98	216
435	98	217
436	98	218
437	98	219
438	98	220
439	98	221
440	98	222
441	98	223
442	98	224
443	98	225
444	98	226
445	98	227
446	98	228
447	98	229
448	98	230
449	98	231
450	98	232
451	98	233
452	99	229
453	100	212
454	101	212
455	102	234
456	102	235
457	102	236
458	103	240
459	103	237
460	103	238
461	103	239
462	104	241
463	104	242
464	104	243
465	104	244
466	105	245
467	105	246
468	105	247
469	105	248
470	105	249
471	105	250
472	106	256
473	106	251
474	106	252
475	106	253
476	106	254
477	106	255
478	107	257
479	107	258
480	107	259
481	107	260
482	107	261
483	107	262
484	108	264
485	108	265
486	108	266
487	108	267
488	108	268
489	109	269
490	109	270
491	109	271
492	110	272
493	110	273
494	110	274
495	110	275
496	110	276
497	110	277
498	110	278
\.


--
-- Name: pollster_rule_subject_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_rule_subject_options_id_seq', 498, true);


--
-- Data for Name: pollster_ruletype; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_ruletype (id, title, js_class) FROM stdin;
1	Show Question	wok.pollster.rules.ShowQuestion
2	Hide Question	wok.pollster.rules.HideQuestion
3	Show Options	wok.pollster.rules.ShowOptions
4	Hide Options	wok.pollster.rules.HideOptions
5	Check Options	wok.pollster.rules.CheckOptions
6	Uncheck Options	wok.pollster.rules.UncheckOptions
7	Exclusive	wok.pollster.rules.Exclusive
8	Future Fill	wok.pollster.rules.FutureFill
9	Future Show Question	wok.pollster.rules.FutureShowQuestion
10	Future Hide Question	wok.pollster.rules.FutureHideQuestion
11	Future Show Options	wok.pollster.rules.FutureShowOptions
12	Future Hide Options	wok.pollster.rules.FutureHideOptions
13	Fill	wok.pollster.rules.Fill
\.


--
-- Name: pollster_ruletype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_ruletype_id_seq', 13, true);


--
-- Data for Name: pollster_survey; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_survey (id, parent_id, title, shortname, version, created, updated, status) FROM stdin;
2	\N	Weekly 2013-2014	weekly		2015-10-10 05:31:44.274815+02	2015-10-10 05:53:42.563198+02	PUBLISHED
1	\N	Intake 2013-2014	intake		2015-10-10 05:30:44.273672+02	2015-10-10 05:53:48.591315+02	PUBLISHED
\.


--
-- Name: pollster_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_survey_id_seq', 2, true);


--
-- Data for Name: pollster_translationoption; Type: TABLE DATA; Schema: public; Owner: epiwork
--
INSERT INTO pollster_translationoption VALUES (1, 1, 1, 'Maschio', '');
INSERT INTO pollster_translationoption VALUES (2, 1, 2, 'Femmina', '');
INSERT INTO pollster_translationoption VALUES (3, 1, 3, '', '');
INSERT INTO pollster_translationoption VALUES (4, 1, 4, '', '');
INSERT INTO pollster_translationoption VALUES (5, 1, 31, 'Sì', '');
INSERT INTO pollster_translationoption VALUES (6, 1, 35, 'Non possiedo alcuna qualifica formale', '');
INSERT INTO pollster_translationoption VALUES (7, 1, 38, 'Diploma di scuola superiore', '');
INSERT INTO pollster_translationoption VALUES (8, 1, 40, 'Diploma di laurea triennale ', '');
INSERT INTO pollster_translationoption VALUES (9, 1, 41, 'Diploma di laurea magistrale o titolo di studio superiore (Ph.D.)', '');
INSERT INTO pollster_translationoption VALUES (10, 1, 43, 'Sono ancora in formazione scolastica', '');
INSERT INTO pollster_translationoption VALUES (11, 1, 55, 'Impiego retribuito, tempo pieno', '');
INSERT INTO pollster_translationoption VALUES (12, 1, 56, 'Impiego retribuito, part time', '');
INSERT INTO pollster_translationoption VALUES (13, 1, 57, 'Lavoratore autonomo (libero professionista, commerciante, contadino, etc.)', '');
INSERT INTO pollster_translationoption VALUES (14, 1, 58, 'Studente (scuola dell''obbligo, scuola superiore, università, etc.)', '');
INSERT INTO pollster_translationoption VALUES (15, 1, 59, 'Casalingo/a', '');
INSERT INTO pollster_translationoption VALUES (16, 1, 60, 'Senza impiego', '');
INSERT INTO pollster_translationoption VALUES (17, 1, 61, 'In pensione', '');
INSERT INTO pollster_translationoption VALUES (18, 1, 63, 'Congedo a lungo termine dall''attività lavorativa (per maternità/paternità, malattia, etc.)', '');
INSERT INTO pollster_translationoption VALUES (19, 1, 64, 'Altro', '');
INSERT INTO pollster_translationoption VALUES (20, 1, 78, 'Professionista (es. manager, medico, insegnante, infermiera, ingegnere, etc.)', '');
INSERT INTO pollster_translationoption VALUES (21, 1, 79, 'Vendita al dettaglio, ristorazione ospitalità e tempo libero (es. commesso di negozio, cameriere, barista, istruttore di palestra etc.)', '');
INSERT INTO pollster_translationoption VALUES (22, 1, 81, 'Lavoro d''ufficio (es. amministratore, assistente finanziario, segretaria etc.)', '');
INSERT INTO pollster_translationoption VALUES (23, 1, 83, 'Lavoratore manuale specializzato (es. meccanico, elettricista, tecnico, etc.)', '');
INSERT INTO pollster_translationoption VALUES (24, 1, 86, 'Lavoratore manuale di altro tipo (es. addetto alle pulizie, addetto alla sicurezza, autista, etc.)', '');
INSERT INTO pollster_translationoption VALUES (25, 1, 88, 'Altro', '');
INSERT INTO pollster_translationoption VALUES (26, 1, 103, 'No', '');
INSERT INTO pollster_translationoption VALUES (27, 1, 104, 'Si, occasionalmente', '');
INSERT INTO pollster_translationoption VALUES (28, 2, 1, 'Man', '');
INSERT INTO pollster_translationoption VALUES (29, 2, 2, 'Vrouw', '');
INSERT INTO pollster_translationoption VALUES (30, 2, 3, '', '');
INSERT INTO pollster_translationoption VALUES (31, 2, 4, '', '');
INSERT INTO pollster_translationoption VALUES (32, 2, 31, 'Mezelf', '');
INSERT INTO pollster_translationoption VALUES (33, 2, 33, 'Iemand anders', '');
INSERT INTO pollster_translationoption VALUES (34, 2, 35, 'Ik heb geen officiële diploma’s', '');
INSERT INTO pollster_translationoption VALUES (35, 2, 38, 'Mavo of vmbo', '');
INSERT INTO pollster_translationoption VALUES (36, 2, 39, 'Havo, vwo of MBO', '');
INSERT INTO pollster_translationoption VALUES (37, 2, 40, 'HBO of WO bachelor', '');
INSERT INTO pollster_translationoption VALUES (38, 2, 41, 'WO master/PhD (doctor)', '');
INSERT INTO pollster_translationoption VALUES (39, 2, 43, 'Ik ben nog bezig met een opleiding', '');
INSERT INTO pollster_translationoption VALUES (40, 2, 55, 'Ik werk fulltime in loondienst', '');
INSERT INTO pollster_translationoption VALUES (41, 2, 56, 'Ik werk parttime in loondienst', '');
INSERT INTO pollster_translationoption VALUES (42, 2, 57, 'Ik werk als zelfstandige/ondernemer', '');
INSERT INTO pollster_translationoption VALUES (43, 2, 58, 'Ik ben scholier of student', '');
INSERT INTO pollster_translationoption VALUES (44, 2, 59, 'Ik ben huisman/huisvrouw', '');
INSERT INTO pollster_translationoption VALUES (45, 2, 60, 'Ik ben werkloos', '');
INSERT INTO pollster_translationoption VALUES (46, 2, 61, 'Ik ben met pensioen', '');
INSERT INTO pollster_translationoption VALUES (47, 2, 63, 'Ik ben thuis vanwege langdurige ziekte of zwangerschapsverlof', '');
INSERT INTO pollster_translationoption VALUES (48, 2, 64, 'Anders', '');
INSERT INTO pollster_translationoption VALUES (49, 2, 78, 'Professional', '');
INSERT INTO pollster_translationoption VALUES (50, 2, 79, 'Verkoop, horeca en vrije tijd', '');
INSERT INTO pollster_translationoption VALUES (51, 2, 81, 'Kantoorwerk', '');
INSERT INTO pollster_translationoption VALUES (52, 2, 83, 'Technisch handwerk', '');
INSERT INTO pollster_translationoption VALUES (53, 2, 86, 'Ander handwerk', '');
INSERT INTO pollster_translationoption VALUES (54, 2, 88, 'Anders', '');
INSERT INTO pollster_translationoption VALUES (55, 2, 103, 'Nee', '');
INSERT INTO pollster_translationoption VALUES (56, 2, 104, 'Ja, af en toe', '');
INSERT INTO pollster_translationoption VALUES (57, 3, 1, 'Man/pojke', '');
INSERT INTO pollster_translationoption VALUES (58, 3, 2, 'Kvinna/flicka', '');
INSERT INTO pollster_translationoption VALUES (59, 3, 3, '', '');
INSERT INTO pollster_translationoption VALUES (60, 3, 4, '', '');
INSERT INTO pollster_translationoption VALUES (61, 3, 5, '', '');
INSERT INTO pollster_translationoption VALUES (62, 3, 6, '', '');
INSERT INTO pollster_translationoption VALUES (63, 3, 7, '1 person ', '');
INSERT INTO pollster_translationoption VALUES (64, 3, 8, '2 personer', '');
INSERT INTO pollster_translationoption VALUES (65, 3, 9, '3 personer', '');
INSERT INTO pollster_translationoption VALUES (66, 3, 10, '4 personer', '');
INSERT INTO pollster_translationoption VALUES (67, 3, 11, '5 personer eller fler', '');
INSERT INTO pollster_translationoption VALUES (68, 3, 12, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (69, 3, 13, '1 person', '');
INSERT INTO pollster_translationoption VALUES (70, 3, 14, '2 personer', '');
INSERT INTO pollster_translationoption VALUES (71, 3, 15, '3 personer', '');
INSERT INTO pollster_translationoption VALUES (72, 3, 16, '4 personer', '');
INSERT INTO pollster_translationoption VALUES (73, 3, 17, '5 personer eller fler', '');
INSERT INTO pollster_translationoption VALUES (74, 3, 18, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (75, 3, 19, '0 barn', '');
INSERT INTO pollster_translationoption VALUES (76, 3, 20, '1 barn', '');
INSERT INTO pollster_translationoption VALUES (77, 3, 21, '2 barn', '');
INSERT INTO pollster_translationoption VALUES (78, 3, 22, '3 barn', '');
INSERT INTO pollster_translationoption VALUES (79, 3, 23, '4 barn eller fler', '');
INSERT INTO pollster_translationoption VALUES (80, 3, 24, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (81, 3, 25, '0 barn', '');
INSERT INTO pollster_translationoption VALUES (82, 3, 26, '1 barn', '');
INSERT INTO pollster_translationoption VALUES (83, 3, 27, '2 barn', '');
INSERT INTO pollster_translationoption VALUES (84, 3, 28, '3 barn', '');
INSERT INTO pollster_translationoption VALUES (85, 3, 29, '4 barn eller fler', '');
INSERT INTO pollster_translationoption VALUES (86, 3, 30, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (87, 3, 31, 'Mig själv', '');
INSERT INTO pollster_translationoption VALUES (88, 3, 32, 'En hushållsmedlem ', '');
INSERT INTO pollster_translationoption VALUES (89, 3, 33, 'Någon annan (utanför mitt hushåll)', '');
INSERT INTO pollster_translationoption VALUES (90, 3, 34, '', '');
INSERT INTO pollster_translationoption VALUES (91, 3, 35, 'Ingen avslutad utbildning  ', '');
INSERT INTO pollster_translationoption VALUES (92, 3, 36, 'Folkskola, 6 eller 7 år', '');
INSERT INTO pollster_translationoption VALUES (93, 3, 37, 'Realskola', '');
INSERT INTO pollster_translationoption VALUES (94, 3, 38, 'Grundskola, 9 år', '');
INSERT INTO pollster_translationoption VALUES (95, 3, 39, 'Gymnasieskola, 2 till 4 år', '');
INSERT INTO pollster_translationoption VALUES (96, 3, 40, 'Universitet/högskola, mindre än 3 år', '');
INSERT INTO pollster_translationoption VALUES (97, 3, 41, 'Universitet/högskola, 3 år eller mer', '');
INSERT INTO pollster_translationoption VALUES (98, 3, 42, 'Annan eftergymnasial påbyggnadsutbildning', '');
INSERT INTO pollster_translationoption VALUES (99, 3, 43, 'Studerar fortfarande', '');
INSERT INTO pollster_translationoption VALUES (100, 3, 44, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (101, 3, 45, 'Ingen avslutad utbildning  ', '');
INSERT INTO pollster_translationoption VALUES (102, 3, 46, 'Folkskola, 6 eller 7 år', '');
INSERT INTO pollster_translationoption VALUES (103, 3, 47, 'Realskola', '');
INSERT INTO pollster_translationoption VALUES (104, 3, 48, 'Grundskola, 9 år', '');
INSERT INTO pollster_translationoption VALUES (105, 3, 49, 'Gymnasieskola, 2 till 4 år', '');
INSERT INTO pollster_translationoption VALUES (106, 3, 50, 'Universitet/högskola, mindre än 3 år', '');
INSERT INTO pollster_translationoption VALUES (107, 3, 51, 'Universitet/högskola, 3 år eller mer', '');
INSERT INTO pollster_translationoption VALUES (108, 3, 52, 'Annan eftergymnasial påbyggnadsutbildning', '');
INSERT INTO pollster_translationoption VALUES (109, 3, 53, 'Studerar fortfarande', '');
INSERT INTO pollster_translationoption VALUES (110, 3, 54, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (111, 3, 55, 'Anställd', '');
INSERT INTO pollster_translationoption VALUES (112, 3, 56, 'Anställd, deltid', '');
INSERT INTO pollster_translationoption VALUES (113, 3, 57, 'Näringsverksamhet', '');
INSERT INTO pollster_translationoption VALUES (114, 3, 58, 'Studerar', '');
INSERT INTO pollster_translationoption VALUES (115, 3, 59, 'Vård av barn/anhörig, hemmamake/-maka', '');
INSERT INTO pollster_translationoption VALUES (116, 3, 60, 'Arbetslös', '');
INSERT INTO pollster_translationoption VALUES (117, 3, 61, 'Pensionär', '');
INSERT INTO pollster_translationoption VALUES (118, 3, 62, 'Föräldraledig ', '');
INSERT INTO pollster_translationoption VALUES (119, 3, 63, 'Sjukskriven ', '');
INSERT INTO pollster_translationoption VALUES (120, 3, 64, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (121, 3, 65, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (122, 3, 66, 'Anställd', '');
INSERT INTO pollster_translationoption VALUES (123, 3, 67, 'Anställd, deltid', '');
INSERT INTO pollster_translationoption VALUES (124, 3, 68, 'Näringsverksamhet', '');
INSERT INTO pollster_translationoption VALUES (125, 3, 69, 'Studerar', '');
INSERT INTO pollster_translationoption VALUES (126, 3, 70, 'Vård av barn/anhörig, hemmamake/-maka', '');
INSERT INTO pollster_translationoption VALUES (127, 3, 71, 'Arbetslös', '');
INSERT INTO pollster_translationoption VALUES (128, 3, 72, 'Pensionär', '');
INSERT INTO pollster_translationoption VALUES (129, 3, 73, 'Föräldraledig ', '');
INSERT INTO pollster_translationoption VALUES (130, 3, 74, 'Sjukskriven ', '');
INSERT INTO pollster_translationoption VALUES (131, 3, 75, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (132, 3, 76, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (133, 3, 77, 'Chefsarbete', '');
INSERT INTO pollster_translationoption VALUES (134, 3, 78, 'Arbete som kräver fördjupad högskolekompetens', '');
INSERT INTO pollster_translationoption VALUES (135, 3, 79, 'visas ej', '');
INSERT INTO pollster_translationoption VALUES (136, 3, 80, 'Arbete som kräver högskolekompetens eller motsvarande', '');
INSERT INTO pollster_translationoption VALUES (137, 3, 81, 'Administration och kundtjänst', '');
INSERT INTO pollster_translationoption VALUES (138, 3, 82, 'Service, omsorg och försäljning', '');
INSERT INTO pollster_translationoption VALUES (139, 3, 83, 'Maskinell tillverkning och transport', '');
INSERT INTO pollster_translationoption VALUES (140, 3, 84, 'Lantbruk, trädgård, skogsbruk, fiske ', '');
INSERT INTO pollster_translationoption VALUES (141, 3, 85, 'Byggverksamhet och tillverkning ', '');
INSERT INTO pollster_translationoption VALUES (142, 3, 86, 'Arbete som kräver kortare utbildning eller introduktion', '');
INSERT INTO pollster_translationoption VALUES (143, 3, 87, 'Militärt arbete', '');
INSERT INTO pollster_translationoption VALUES (144, 3, 88, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (145, 3, 89, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (146, 3, 90, 'Chefsarbete', '');
INSERT INTO pollster_translationoption VALUES (147, 3, 91, 'Arbete som kräver fördjupad högskolekompetens', '');
INSERT INTO pollster_translationoption VALUES (148, 3, 92, 'visas ej?', '');
INSERT INTO pollster_translationoption VALUES (149, 3, 93, 'Arbete som kräver högskolekompetens eller motsvarande', '');
INSERT INTO pollster_translationoption VALUES (150, 3, 94, 'Administration och kundtjänst', '');
INSERT INTO pollster_translationoption VALUES (151, 3, 95, 'Service, omsorg och försäljning', '');
INSERT INTO pollster_translationoption VALUES (152, 3, 96, 'Maskinell tillverkning och transport', '');
INSERT INTO pollster_translationoption VALUES (153, 3, 97, 'Lantbruk, trädgård, skogsbruk, fiske ', '');
INSERT INTO pollster_translationoption VALUES (154, 3, 98, 'Byggverksamhet och tillverkning ', '');
INSERT INTO pollster_translationoption VALUES (155, 3, 99, 'Arbete som kräver kortare utbildning eller introduktion', '');
INSERT INTO pollster_translationoption VALUES (156, 3, 100, 'Militärt arbete', '');
INSERT INTO pollster_translationoption VALUES (157, 3, 101, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (158, 3, 102, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (159, 3, 103, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (160, 3, 104, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (161, 3, 105, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (162, 3, 106, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (163, 3, 107, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (164, 3, 108, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (165, 3, 109, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (166, 3, 110, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (167, 3, 111, '', '');
INSERT INTO pollster_translationoption VALUES (168, 3, 112, 'Ingen avslutad utbildning  ', '');
INSERT INTO pollster_translationoption VALUES (169, 3, 113, 'Folkskola, 6 eller 7 år', '');
INSERT INTO pollster_translationoption VALUES (170, 3, 114, 'Realskola', '');
INSERT INTO pollster_translationoption VALUES (171, 3, 115, 'Grundskola, 9 år', '');
INSERT INTO pollster_translationoption VALUES (172, 3, 116, 'Gymnasieskola, 2 till 4 år', '');
INSERT INTO pollster_translationoption VALUES (173, 3, 117, 'Universitet/högskola, mindre än 3 år', '');
INSERT INTO pollster_translationoption VALUES (174, 3, 118, 'Universitet/högskola, 3 år eller mer', '');
INSERT INTO pollster_translationoption VALUES (175, 3, 119, 'Annan eftergymnasial påbyggnadsutbildning', '');
INSERT INTO pollster_translationoption VALUES (176, 3, 120, 'Studerar fortfarande', '');
INSERT INTO pollster_translationoption VALUES (177, 3, 121, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (178, 3, 122, 'Anställd', '');
INSERT INTO pollster_translationoption VALUES (179, 3, 123, 'Anställd, deltid', '');
INSERT INTO pollster_translationoption VALUES (180, 3, 124, 'Näringsverksamhet', '');
INSERT INTO pollster_translationoption VALUES (181, 3, 125, 'Studerar', '');
INSERT INTO pollster_translationoption VALUES (182, 3, 126, 'Vård av barn/anhörig, hemmamake/-maka', '');
INSERT INTO pollster_translationoption VALUES (183, 3, 127, 'Arbetslös', '');
INSERT INTO pollster_translationoption VALUES (184, 3, 128, 'Pensionär', '');
INSERT INTO pollster_translationoption VALUES (185, 3, 129, 'Föräldraledig ', '');
INSERT INTO pollster_translationoption VALUES (186, 3, 130, 'Sjukskriven ', '');
INSERT INTO pollster_translationoption VALUES (187, 3, 131, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (188, 3, 132, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (189, 3, 133, 'Chefsarbete', '');
INSERT INTO pollster_translationoption VALUES (190, 3, 134, 'Arbete som kräver fördjupad högskolekompetens', '');
INSERT INTO pollster_translationoption VALUES (191, 3, 135, 'Administration och kundtjänst', '');
INSERT INTO pollster_translationoption VALUES (192, 3, 136, 'Arbete som kräver högskolekompetens eller motsvarande', '');
INSERT INTO pollster_translationoption VALUES (193, 3, 137, 'Administration och kundtjänst', '');
INSERT INTO pollster_translationoption VALUES (194, 3, 138, 'Service, omsorg och försäljning', '');
INSERT INTO pollster_translationoption VALUES (195, 3, 139, 'Maskinell tillverkning och transport', '');
INSERT INTO pollster_translationoption VALUES (196, 3, 140, 'Lantbruk, trädgård, skogsbruk, fiske ', '');
INSERT INTO pollster_translationoption VALUES (197, 3, 141, 'Byggverksamhet och tillverkning ', '');
INSERT INTO pollster_translationoption VALUES (198, 3, 142, 'Arbete som kräver kortare utbildning eller introduktion', '');
INSERT INTO pollster_translationoption VALUES (199, 3, 143, 'Militärt arbete', '');
INSERT INTO pollster_translationoption VALUES (200, 3, 144, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (201, 3, 145, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (202, 3, 146, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (203, 3, 147, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (204, 3, 148, 'Jag vill inte svara', '');
INSERT INTO pollster_translationoption VALUES (205, 3, 149, '', '');
INSERT INTO pollster_translationoption VALUES (206, 3, 150, '', '');
INSERT INTO pollster_translationoption VALUES (207, 3, 151, '', '');
INSERT INTO pollster_translationoption VALUES (208, 3, 152, '', '');
INSERT INTO pollster_translationoption VALUES (209, 3, 153, '', '');
INSERT INTO pollster_translationoption VALUES (210, 3, 154, '', '');
INSERT INTO pollster_translationoption VALUES (211, 3, 155, '', '');
INSERT INTO pollster_translationoption VALUES (212, 3, 156, '', '');
INSERT INTO pollster_translationoption VALUES (213, 3, 157, '', '');
INSERT INTO pollster_translationoption VALUES (214, 3, 158, '', '');
INSERT INTO pollster_translationoption VALUES (215, 3, 159, '', '');
INSERT INTO pollster_translationoption VALUES (216, 3, 160, '', '');
INSERT INTO pollster_translationoption VALUES (217, 3, 161, '', '');
INSERT INTO pollster_translationoption VALUES (218, 3, 162, '', '');
INSERT INTO pollster_translationoption VALUES (219, 3, 163, '', '');
INSERT INTO pollster_translationoption VALUES (220, 3, 164, '', '');
INSERT INTO pollster_translationoption VALUES (221, 3, 165, '', '');
INSERT INTO pollster_translationoption VALUES (222, 3, 166, '', '');
INSERT INTO pollster_translationoption VALUES (223, 3, 167, '', '');
INSERT INTO pollster_translationoption VALUES (224, 3, 168, '', '');
INSERT INTO pollster_translationoption VALUES (225, 3, 169, '', '');
INSERT INTO pollster_translationoption VALUES (226, 3, 170, '', '');
INSERT INTO pollster_translationoption VALUES (227, 3, 171, '', '');
INSERT INTO pollster_translationoption VALUES (228, 3, 172, '', '');
INSERT INTO pollster_translationoption VALUES (229, 3, 173, '', '');
INSERT INTO pollster_translationoption VALUES (230, 3, 174, '', '');
INSERT INTO pollster_translationoption VALUES (231, 4, 188, 'Nee, geen symptomen', '');
INSERT INTO pollster_translationoption VALUES (232, 4, 189, 'Koorts', '');
INSERT INTO pollster_translationoption VALUES (233, 4, 190, 'Koude rillingen', '');
INSERT INTO pollster_translationoption VALUES (234, 4, 191, 'Niezen', '');
INSERT INTO pollster_translationoption VALUES (235, 4, 192, 'Zere keel', '');
INSERT INTO pollster_translationoption VALUES (236, 4, 193, 'Loopneus of verstopte neus', '');
INSERT INTO pollster_translationoption VALUES (237, 4, 194, 'Hoesten', '');
INSERT INTO pollster_translationoption VALUES (238, 4, 195, 'Verkleurd slijm', '');
INSERT INTO pollster_translationoption VALUES (239, 4, 196, 'Kortademigheid', '');
INSERT INTO pollster_translationoption VALUES (240, 4, 197, 'Pijn op de borst', '');
INSERT INTO pollster_translationoption VALUES (241, 4, 198, 'Gevoel van vermoeidheid/uitgeput', '');
INSERT INTO pollster_translationoption VALUES (242, 4, 199, 'Spier/gewrichtspijn', '');
INSERT INTO pollster_translationoption VALUES (243, 4, 200, 'Hoofdpijn', '');
INSERT INTO pollster_translationoption VALUES (244, 4, 201, 'Verminderde eetlust', '');
INSERT INTO pollster_translationoption VALUES (245, 4, 202, 'Waterige of bloeddoorlopen ogen', '');
INSERT INTO pollster_translationoption VALUES (246, 4, 203, 'Pijn in de maag', '');
INSERT INTO pollster_translationoption VALUES (247, 4, 205, 'Misselijkheid', '');
INSERT INTO pollster_translationoption VALUES (248, 4, 206, 'Overgeven', '');
INSERT INTO pollster_translationoption VALUES (249, 4, 207, 'Diarree', '');
INSERT INTO pollster_translationoption VALUES (250, 4, 210, 'Andere symptomen', '');
INSERT INTO pollster_translationoption VALUES (251, 4, 234, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (252, 4, 235, 'Nee', '');
INSERT INTO pollster_translationoption VALUES (253, 4, 236, 'Dat weet ik niet (meer)', '');
INSERT INTO pollster_translationoption VALUES (254, 4, 237, '', '');
INSERT INTO pollster_translationoption VALUES (255, 4, 238, '37°C of lager', '');
INSERT INTO pollster_translationoption VALUES (256, 4, 239, '', '');
INSERT INTO pollster_translationoption VALUES (257, 4, 240, '', '');
INSERT INTO pollster_translationoption VALUES (258, 4, 241, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (259, 4, 242, 'Nee', '');
INSERT INTO pollster_translationoption VALUES (260, 4, 243, 'Dat weet ik niet (meer)', '');
INSERT INTO pollster_translationoption VALUES (261, 4, 269, 'Kies datum:', '');
INSERT INTO pollster_translationoption VALUES (262, 4, 270, 'Dat weet ik niet (meer)', '');
INSERT INTO pollster_translationoption VALUES (263, 4, 272, 'Ja, ik heb griep of griepachtige verschijnselen', '');
INSERT INTO pollster_translationoption VALUES (264, 4, 273, 'Ja, ik ben verkouden', '');
INSERT INTO pollster_translationoption VALUES (265, 4, 274, 'Ja, van een allergie zoals hooikoorts', '');
INSERT INTO pollster_translationoption VALUES (266, 4, 276, 'Ja, ik heb maag-/darmklachten of buikgriep', '');
INSERT INTO pollster_translationoption VALUES (267, 4, 277, 'Ja, ik heb een andere ziekte die de klachten veroorzaakt', '');
INSERT INTO pollster_translationoption VALUES (268, 4, 278, 'Nee, ik heb geen idee', '');
INSERT INTO pollster_translationoption VALUES (269, 5, 175, '', '');
INSERT INTO pollster_translationoption VALUES (270, 5, 176, '', '');
INSERT INTO pollster_translationoption VALUES (271, 5, 177, '', '');
INSERT INTO pollster_translationoption VALUES (272, 5, 178, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (273, 5, 179, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (274, 5, 180, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (275, 5, 181, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (276, 5, 182, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (277, 5, 183, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (278, 5, 184, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (279, 5, 185, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (280, 5, 186, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (281, 5, 187, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (282, 5, 188, 'Inget av dessa symptom', '');
INSERT INTO pollster_translationoption VALUES (283, 5, 189, 'Feber', '');
INSERT INTO pollster_translationoption VALUES (284, 5, 190, 'Frossa', '');
INSERT INTO pollster_translationoption VALUES (285, 5, 191, 'Nysningar', '');
INSERT INTO pollster_translationoption VALUES (286, 5, 192, 'Ont i halsen', '');
INSERT INTO pollster_translationoption VALUES (287, 5, 193, 'Snuva', '');
INSERT INTO pollster_translationoption VALUES (288, 5, 194, 'Hosta', '');
INSERT INTO pollster_translationoption VALUES (289, 5, 195, 'Färgade upphostningar', '');
INSERT INTO pollster_translationoption VALUES (290, 5, 196, 'Andfåddhet', '');
INSERT INTO pollster_translationoption VALUES (291, 5, 197, 'Bröstsmärtor', '');
INSERT INTO pollster_translationoption VALUES (292, 5, 198, 'Stor trötthet, utmattning', '');
INSERT INTO pollster_translationoption VALUES (293, 5, 199, 'Muskelvärk, värk i kroppen', '');
INSERT INTO pollster_translationoption VALUES (294, 5, 200, 'Huvudvärk', '');
INSERT INTO pollster_translationoption VALUES (295, 5, 201, 'Aptitlöshet', '');
INSERT INTO pollster_translationoption VALUES (296, 5, 202, 'Rinnande/rödsprängda ögon', '');
INSERT INTO pollster_translationoption VALUES (297, 5, 203, 'Ont i magen', '');
INSERT INTO pollster_translationoption VALUES (298, 5, 204, 'Magknip', '');
INSERT INTO pollster_translationoption VALUES (299, 5, 205, 'Illamående', '');
INSERT INTO pollster_translationoption VALUES (300, 5, 206, 'Kräkningar', '');
INSERT INTO pollster_translationoption VALUES (301, 5, 207, 'Diarré', '');
INSERT INTO pollster_translationoption VALUES (302, 5, 208, 'Slem i avföringen', '');
INSERT INTO pollster_translationoption VALUES (303, 5, 209, 'Blod i avföringen', '');
INSERT INTO pollster_translationoption VALUES (304, 5, 210, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (305, 5, 211, 'inga symptom', '');
INSERT INTO pollster_translationoption VALUES (306, 5, 212, 'Feber', '');
INSERT INTO pollster_translationoption VALUES (307, 5, 213, 'Frossa', '');
INSERT INTO pollster_translationoption VALUES (308, 5, 214, 'Nysningar', '');
INSERT INTO pollster_translationoption VALUES (309, 5, 215, 'Ont i halsen', '');
INSERT INTO pollster_translationoption VALUES (310, 5, 216, 'Snuva', '');
INSERT INTO pollster_translationoption VALUES (311, 5, 217, 'Hosta', '');
INSERT INTO pollster_translationoption VALUES (312, 5, 218, 'Färgade upphostningar', '');
INSERT INTO pollster_translationoption VALUES (313, 5, 219, 'Andfåddhet', '');
INSERT INTO pollster_translationoption VALUES (314, 5, 220, 'Bröstsmärtor', '');
INSERT INTO pollster_translationoption VALUES (315, 5, 221, 'Extrem trötthet, utmattning', '');
INSERT INTO pollster_translationoption VALUES (316, 5, 222, 'Muskelvärk, värk i kroppen', '');
INSERT INTO pollster_translationoption VALUES (317, 5, 223, 'Huvudvärk', '');
INSERT INTO pollster_translationoption VALUES (318, 5, 224, 'Aptitlöshet', '');
INSERT INTO pollster_translationoption VALUES (319, 5, 225, 'Rinnande/blodsprängda ögon', '');
INSERT INTO pollster_translationoption VALUES (320, 5, 226, 'Ont i magen', '');
INSERT INTO pollster_translationoption VALUES (321, 5, 227, 'Magknip', '');
INSERT INTO pollster_translationoption VALUES (322, 5, 228, 'Illamående', '');
INSERT INTO pollster_translationoption VALUES (323, 5, 229, 'Kräkningar', '');
INSERT INTO pollster_translationoption VALUES (324, 5, 230, 'Diarre', '');
INSERT INTO pollster_translationoption VALUES (325, 5, 231, 'Slem i avföringen', '');
INSERT INTO pollster_translationoption VALUES (326, 5, 232, 'Blod i avföringen', '');
INSERT INTO pollster_translationoption VALUES (327, 5, 233, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (328, 5, 234, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (329, 5, 235, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (330, 5, 236, 'Jag vet inte/minns inte', '');
INSERT INTO pollster_translationoption VALUES (331, 5, 237, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (332, 5, 238, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (333, 5, 239, 'Jag vet inte', '');
INSERT INTO pollster_translationoption VALUES (334, 5, 240, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (335, 5, 241, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (336, 5, 242, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (337, 5, 243, 'Jag vet inte', '');
INSERT INTO pollster_translationoption VALUES (338, 5, 244, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (339, 5, 245, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (340, 5, 246, '1 gång', '');
INSERT INTO pollster_translationoption VALUES (341, 5, 247, '2 gånger', '');
INSERT INTO pollster_translationoption VALUES (342, 5, 248, '3 gånger', '');
INSERT INTO pollster_translationoption VALUES (343, 5, 249, '4-5 gånger', '');
INSERT INTO pollster_translationoption VALUES (344, 5, 250, '6 eller fler gånger', '');
INSERT INTO pollster_translationoption VALUES (345, 5, 251, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (346, 5, 252, '1 gång', '');
INSERT INTO pollster_translationoption VALUES (347, 5, 253, '2 gånger', '');
INSERT INTO pollster_translationoption VALUES (348, 5, 254, '3 gånger', '');
INSERT INTO pollster_translationoption VALUES (349, 5, 255, '4-5 gånger', '');
INSERT INTO pollster_translationoption VALUES (350, 5, 256, '6 eller fler gånger', '');
INSERT INTO pollster_translationoption VALUES (351, 5, 257, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (352, 5, 258, '1 gång', '');
INSERT INTO pollster_translationoption VALUES (353, 5, 259, '2 gånger', '');
INSERT INTO pollster_translationoption VALUES (354, 5, 260, '3 gånger', '');
INSERT INTO pollster_translationoption VALUES (355, 5, 261, '4-5 gånger', '');
INSERT INTO pollster_translationoption VALUES (356, 5, 262, '6 eller fler gånger', '');
INSERT INTO pollster_translationoption VALUES (357, 5, 263, 'NullAns', '');
INSERT INTO pollster_translationoption VALUES (358, 5, 264, '1 gång', '');
INSERT INTO pollster_translationoption VALUES (359, 5, 265, '2 gånger', '');
INSERT INTO pollster_translationoption VALUES (360, 5, 266, '3 gånger', '');
INSERT INTO pollster_translationoption VALUES (361, 5, 267, '4-5 gånger', '');
INSERT INTO pollster_translationoption VALUES (362, 5, 268, '6 eller fler gånger', '');
INSERT INTO pollster_translationoption VALUES (363, 5, 269, 'Datum:', '');
INSERT INTO pollster_translationoption VALUES (364, 5, 270, 'Jag vet inte/minns inte', '');
INSERT INTO pollster_translationoption VALUES (365, 5, 271, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (366, 5, 272, 'Influensaliknande sjukdom', '');
INSERT INTO pollster_translationoption VALUES (367, 5, 273, 'Förkylning/snuva', '');
INSERT INTO pollster_translationoption VALUES (368, 5, 274, 'Allergi/pollen', '');
INSERT INTO pollster_translationoption VALUES (369, 5, 275, 'Astma', '');
INSERT INTO pollster_translationoption VALUES (370, 5, 276, 'Magsjuka/gastroenterit', '');
INSERT INTO pollster_translationoption VALUES (371, 5, 277, 'Annat', '');
INSERT INTO pollster_translationoption VALUES (372, 5, 278, 'Jag vet inte ', '');
INSERT INTO pollster_translationoption VALUES (373, 5, 279, '', '');
INSERT INTO pollster_translationoption VALUES (374, 5, 280, '', '');
INSERT INTO pollster_translationoption VALUES (375, 5, 281, '', '');
INSERT INTO pollster_translationoption VALUES (376, 5, 282, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (377, 5, 283, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (378, 5, 284, 'Nej', '');
INSERT INTO pollster_translationoption VALUES (379, 5, 285, 'Ja', '');
INSERT INTO pollster_translationoption VALUES (380, 5, 286, '', '');
INSERT INTO pollster_translationoption VALUES (381, 5, 287, '', '');
INSERT INTO pollster_translationoption VALUES (382, 5, 288, '', '');
INSERT INTO pollster_translationoption VALUES (383, 5, 289, '', '');
INSERT INTO pollster_translationoption VALUES (384, 5, 290, '', '');
INSERT INTO pollster_translationoption VALUES (385, 5, 291, '', '');
INSERT INTO pollster_translationoption VALUES (386, 5, 292, '', '');
INSERT INTO pollster_translationoption VALUES (387, 5, 293, '', '');
INSERT INTO pollster_translationoption VALUES (388, 5, 294, '', '');
INSERT INTO pollster_translationoption VALUES (389, 5, 295, '', '');
INSERT INTO pollster_translationoption VALUES (390, 5, 296, '', '');
INSERT INTO pollster_translationoption VALUES (391, 5, 297, '', '');



--
-- Name: pollster_translationquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_translationquestion_id_seq', 83, true);


--
-- Data for Name: pollster_translationquestioncolumn; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_translationquestioncolumn (id, translation_id, column_id, title) FROM stdin;
\.


--
-- Name: pollster_translationquestioncolumn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_translationquestioncolumn_id_seq', 1, false);


--
-- Data for Name: pollster_translationquestionrow; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_translationquestionrow (id, translation_id, row_id, title) FROM stdin;
\.


--
-- Name: pollster_translationquestionrow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_translationquestionrow_id_seq', 1, false);


--
-- Data for Name: pollster_translationsurvey; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_translationsurvey (id, survey_id, language, title, status) FROM stdin;
1	1	it	Adesione	DRAFT
2	1	nl	Aanmelding als griepmeter	DRAFT
4	2	nl	Wekelijkse vragenlijst	DRAFT
5	2	sv	Symptom	PUBLISHED
3	1	sv	Bakgrund	PUBLISHED
\.


--
-- Name: pollster_translationsurvey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_translationsurvey_id_seq', 5, true);


--
-- Data for Name: pollster_virtualoptiontype; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY pollster_virtualoptiontype (id, title, question_data_type_id, js_class) FROM stdin;
1	Range	2	wok.pollster.virtualoptions.TextRange
2	Range	3	wok.pollster.virtualoptions.NumericRange
3	Range	4	wok.pollster.virtualoptions.DateRange
4	Years ago	4	wok.pollster.virtualoptions.DateYearsAgo
5	Years ago	5	wok.pollster.virtualoptions.YearMonthYearsAgo
6	Weeks ago	6	wok.pollster.virtualoptions.TimestampWeeksAgo
7	Regular expression	2	wok.pollster.virtualoptions.RegularExpression
\.


--
-- Name: pollster_virtualoptiontype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('pollster_virtualoptiontype_id_seq', 7, true);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY registration_registrationprofile (id, user_id, activation_key) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: reminder_newsletter; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_newsletter (id, date, sender_email, sender_name, published) FROM stdin;
\.


--
-- Name: reminder_newsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_newsletter_id_seq', 1, false);


--
-- Data for Name: reminder_newslettertemplate; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_newslettertemplate (id, is_default_reminder, is_default_newsitem, sender_email, sender_name) FROM stdin;
\.


--
-- Name: reminder_newslettertemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_newslettertemplate_id_seq', 1, false);


--
-- Data for Name: reminder_newslettertemplatetranslation; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_newslettertemplatetranslation (id, subject, message, language_code, master_id) FROM stdin;
\.


--
-- Name: reminder_newslettertemplatetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_newslettertemplatetranslation_id_seq', 1, false);


--
-- Data for Name: reminder_newslettertranslation; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_newslettertranslation (id, subject, message, language_code, master_id) FROM stdin;
\.


--
-- Name: reminder_newslettertranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_newslettertranslation_id_seq', 1, false);


--
-- Data for Name: reminder_remindererror; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_remindererror (id, "timestamp", user_id, message, traceback) FROM stdin;
\.


--
-- Name: reminder_remindererror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_remindererror_id_seq', 1, false);


--
-- Data for Name: reminder_remindersettings; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_remindersettings (id, site_id, send_reminders, begin_date, "interval", currently_sending, batch_size, last_process_started_date) FROM stdin;
\.


--
-- Name: reminder_remindersettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_remindersettings_id_seq', 1, false);


--
-- Data for Name: reminder_userreminderinfo; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY reminder_userreminderinfo (id, user_id, last_reminder, active, language) FROM stdin;
\.


--
-- Name: reminder_userreminderinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('reminder_userreminderinfo_id_seq', 1, false);


--
-- Data for Name: snippet_snippet; Type: TABLE DATA; Schema: public; Owner: epiwork
--

INSERT INTO snippet_snippet VALUES (1, 'block_sponsors.html', '{% load banner_tags %}
<div class="block sponsors">
Sponsorer<br />
<div>{% banner_image "Sponsors" %}</div>
<div><a href="/project/sponsors/">Karolinska institutet</a></div>
</div>
<div class="block partijen">
Partijen<br />
<div>{% banner_image "Epi work" %}</div>
<div><a href="/project/partijen/">Epi work</a></div>
</div>', '');
INSERT INTO snippet_snippet VALUES (15, '<br /> ', '<br />
', '');
INSERT INTO snippet_snippet VALUES (32, 'EmailaFriendButton', '<FORM>
<INPUT TYPE="button" VALUE="Tipsa en vän om Influensakoll" onClick="parent.location=''mailto:Skriv din väns epostadress här?subject=Influensakoll rekommenderas&Body=Hej! Jag hittade just det nya projektet Influensakoll och tyckte det kunde vara intressant för dig! Influensakoll är Smittskyddsinstitutets nya sätt att hålla koll på influensan med allmänhetens hjälp. Här kan man gå med: http://www.influensakoll.se''"> 
</FORM> 
', '');
INSERT INTO snippet_snippet VALUES (28, 'Facebook_like', '<p>
<FONT COLOR="d30044">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/sv_SE/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, ''script'', ''facebook-jssdk''));</script>

<div class="fb-like-box" data-href="http://www.facebook.com/influensakoll" data-width="292" data-show-faces="false" data-stream="false" data-header="true"></div>
</p>
</FONT>', '');
INSERT INTO snippet_snippet VALUES (4, 'FAQ', '<h1><a name="999">Frågor och svar</h1></a>
<p>På den här sidan har vi samlat vanliga frågor och svar. Om du inte hittar svaret på din fråga är du välkommen att <a href="http://www.influensakoll.se/contact/">kontakta oss.</a> </p>


<br />
<h2>Frågor om ditt deltagande</h2>
<p>
<a href="#1">Hur gör jag för att gå med?</a>
<br />
<a href="#2">Hur berättar jag att jag är sjuk?</a>
<br />
<a href="#3">Och om jag inte är sjuk?</a>
<br />
<a href="#4">Hur länge måste jag vara med?</a>
<br />
<a href="#5">Vad gör ni med den information jag uppger?</a>
<br />
<a href="#6">Kan någon hitta min adress genom den information jag uppger?</a>
<br />
<a href="#7">Kan jag delta för mina barn?</a>
<br />
<a href="#77">Hur gör jag för att avsluta mitt deltagande i Influensakoll?</a>
<br />
</p>
<br />
<h2>Frågor om influensa och luftvägsinfektioner</h2>
<p>
<a href="#8">Vilka är symtomen på influensa?</a>
<br />
<a href="#9">Hur ser influensavirus ut?</a>
<br />
<a href="#10">Vad händer i kroppen när jag smittas av influensa?</a>
<br />
<a href="#11">Hur sprids influensavirus?</a>
<br />
<a href="#12">Hur kan man undvika att bli smittad?</a>
<br />
<a href="#13">Hur avgör läkaren om jag har influensa?</a>
<br />
<a href="#14">Varför är det så att folk får influensa mest på vintern?</a>
<br />
<a href="#15">Är barn mindre motståndskraftiga mot influensa?</a>
<br />
<a href="#16">Vad är en influensaepidemi?</a>
<br />
<a href="#17">Vad är en pandemi?</a>
<br />
<hr /></p>
<br />
<h2>Frågor om ditt deltagande</h2>
<a name="1"><h3>Hur gör jag för att gå med?</h3></a>
<p>1.	Skapa ett användarkonto genom att klicka på <b>gå med</b> längst upp till höger på sidan (röd knapp)<br />
<p>2.	En aktiveringslänk skickas till den e-postadress du angivit. Klicka på länken för att aktivera ditt konto<br />
<p>3.	Skapa en eller flera profiler för ditt konto<br />
<p>4.	Besvara bakgrundsformuläret<br /> 
<p>Nu är du en av Influensakolls influensarapportörer. Kom ihåg att rapportera varje vecka oavsett om du har några symtom eller inte. <br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="2"><h3>Hur berättar jag att jag är sjuk?</h3></a>
<p>Varje vecka skickas en e-post till dig med en länk till ett frågeformulär. Det är viktigt att fylla i formuläret oavsett om du har några symptom eller inte. För att rapportera måste du först skapa ett användarkonto (<a href="#1">Se fråga 1.</a>).
<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="3"><h3>Och om jag inte är sjuk?</h3></a>
<p>Då vill vi veta det också. För att kunna dra några slutsatser om hur många som är sjuka är det lika viktigt att de som är friska rapporterar att de är friska som att de som är sjuka rapporterar att de är sjuka. 

Därför skickar vi en gång per vecka ett e-postmeddelande för att påminna dig.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="4"><h3>Hur länge måste jag vara med?</h3></a>
<p>Rapporteringen till influensakoll pågår till och med maj 2012. Vi vet att många redan är sjuka när de går med som influensarapportörer i Influensakoll. Det är ganska naturligt eftersom det ofta är först då som man kommer i kontakt med den här sajten. Detta leder dock till en överskattning av sjukligheten bland dem som är alldeles nya influensarapportörer. Den mest tillförlitliga uppskattningen av sjukligheten kommer därför från dem som varit rapportörer under minst sex veckor i rad.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="5"><h3>Vad gör ni med den information jag uppger?</h3></a>
<p>Läs här: <a href="http://www.influensakoll.se/fakta-om-datainsamlingen/">Fakta om datainsamlingen.</a> 
<br /> 
<a href="#999">Tillbaka</a></p>
<br />
<hr />
<br />
<a name="6"><h3>Kan någon hitta min adress genom den information jag uppger?</h3></a>
<p>Nej, det är inte möjligt. Vi ber influensarapportörerna att endast uppge sitt postnummer. De flesta postnummer täcker flera hundra människor. I Influensakoll finns en spärrfunktion som gör att om ett 

postnummerområde är så litet att det finns risk för att enskilda människor skulle kunna kännas igen så slås det samman med andra postnummerområden. På alla kartor är den minsta geografiska enheten så stor 

att den åtminstone täcker 200 personer. Det är därför inte möjligt att identifiera en specifik adress utifrån kartorna på vår webbplats.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="7"><h3>Kan jag delta för mina barn?</h3></a>
<p>Ja gärna! Du kan rapportera för ditt barn genom att skapa en profil för ditt barn på ditt användarkonto på Influensakoll. Gör så här:<br />
1. Klicka på <b>"Mitt konto"</b>högst upp i högra hörnet på sidan. <br />
2. Här får du får flera val som rör ditt användarkonto. Klicka på <a href="http://www.influensakoll.se/survey/people/add/">"Lägg till profil"</a>. <br />
3. Skriv ett namn på den profil du vill lägga till för ditt barn och klicka på knappen "lägg till". <br />
4. Nu hamnar du på en sida där dina profiler listas. Efter varje profilnamn finns tre länkar till de aktiviteter du kan välja mellan. Klicka på länken "uppdatera bakgrundsinformation" för att fylla i 

bakgrundsformuläret för ditt barns profil. Observera att du måste fylla i ett bakgrundsformulär för profilen innan det är möjligt att rapportera.<br />
5. När du en gång per vecka får en påminnelse till den e-postadress som angivits för ditt användarkonto ska du logga in och göra en rapport för varje profil. <br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="77"><h3>Hur gör jag för att avsluta mitt deltagande i Influensakoll?</h3></a>
<p>Du kan avsluta ditt deltagande genom att skicka ett e-postmeddelande till influensakoll@smi.se där du anger ditt användarnamn.<br /> 
<a href="#999">Tillbaka</a>
<br />
<br />
<hr /></p>
<br />
<h2>Frågor om influensa och luftvägsinfektioner</h2>
<a name="8"><h3>Vilka är symtomen på influensa?</h3></a>
<p>Symtomen kommer ofta plötsligt och består av frossa, hög feber, huvudvärk, muskelvärk och hosta. Det värsta brukar vara över efter några dagar och efter någon vecka är många så friska att de kan återgå 

till arbetet, men hosta och trötthet kan hänga i ett tag.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="9"><h3>Hur ser influensavirus ut?</h3></a>
<p>Influensavirus är precis som alla virus: mycket, mycket litet. Enstaka virus ser ut som en mycket liten tennisboll med spikar som sticker ut. Ett virus är 200 nanometer (0,2 miljondels meter) stort. 

Spikarna på utsidan är proteiner med vilka viruset kan tränga sig in i cellerna i de övre luftvägarna och sedan ut igen. <br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="10"><h3>Vad händer i kroppen när jag smittas av influensa?</h3></a>
<p>Influensaviruset sätter sig i luftvägarna och skadar cellerna där.  Immunförsvaret känner snabbt att viruset är främmande för kroppen och en rad processer sätter igång som gör att vi känner oss sjuka i 

hela kroppen. Immunförsvarets vita blodkroppar aktiveras i blodet vid en infektion och skickar ut signaler som påverkar området i hjärnan som reglerar kroppstemperaturen vilket gör att vi får feber. Feber är 

ett av naturens sätt att göra miljön i kroppen otrivsam för viruset eftersom virus trivs bäst i 37 grader – den temperatur som de flesta har när de är friska.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="11"><h3>Hur sprids influensavirus?</h3></a>
<p>Influensavirus är ett luftburet virus. Det smittar genom små partiklar som bär viruset i luften (aerosol), saliv- eller sekretdroppar eller kroppskontakt. Viruset tar 

sig in i luftvägarna genom inandningen. Från det att man blir smittat tar det 1 till 3 dygn innan man blir sjuk. 
<p>Influensasjukdom kan orsakas av två huvudtyper av influensavirus, influensavirus typ A och B. A-viruset är det som kan ge stora utbrott över hela världen. B-viruset ger mer begränsade utbrott. Sedan mitten på 70-talet har vi haft fyra virus, tre undertyper av influensa A och influensa B, som cirkulerar över världen. Dessa förändrar sig ständigt, och därför kan vi bli sjuka igen, trots att vi haft alla fyra tidigare.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="12"><h3>Hur kan man undvika att bli smittad?</h3></a>
<p>Det är viktigt att den som är sjuk inte hostar och nyser rakt ut. Gör till en vana att alltid hosta och nysa i armvecket och använda pappersnäsdukar som sedan slängs i en soppåse. Handtvätt med tvål och 

vatten kan minska risken att en sjuk sprider smitta och att en frisk smittas. Komplettera gärna med handsprit. Hur vet man att man tvättat händerna tillräckligt länge? Ett tips är att tyst för sig själv 

sjunga ”Blinka lilla stjärna”. En vers tar cirka 20 sekunder vilket är tillräckligt länge. 
Om en person med misstänkt influensa måste träffa andra är det bra att hålla så stort avstånd som möjligt och att inte ta i hand eller kyssa på kind.  Friska personer bör om möjligt undvika närkontakt med 

misstänkta influensasjuka. Friska personer bör undvika att röra vid ögon, näsa och mun eftersom influensavirus kan ha fastnat på ett föremål som de nyligen rört vid.
<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="13"><h3>Hur avgör läkaren om du har influensa?</h3></a>
<p>I allmänhet sätter läkaren sin diagnos baserat på de så kallade kliniska symtomen. Det kan vara svårt att skilja mellan influensa och andra luftvägsinfektioner. Om det verkligen är influensa kan säkrast 

konstateras genom virusprovtagning från näs- eller halsslem. Slemmet samlas upp med en bomullspinne och skickas till ett viruslaboratorium för analys. Under en influensaepidemi, har endast 60 till 70 % av 

dem som uppvisar symtom på influensa influensavirus.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="14"><h3>Varför är det så att folk får influensa mest på vintern?</h3></a>
<p>Influensavirus sprider sig lättast på vintern och början på våren. Man tror att detta beror på att människor oftare är inomhus och därmed närmare varandra under den "kalla årstiden". Dessutom är luften i 

ett hus under den kalla perioden ofta torr, som ett resultat av detta förblir influensavirus aktivt längre.
<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="15"><h3>Är barn mindre motståndskraftiga mot influensa?</h3></a>
<p>Barn löper störst risk att få influensa dels för att deras immunsystem i allmänhet aldrig varit i kontakt med influensavirus innan. Dessutom smittar de varandra i skolan, dagis, etc. Under en 

influensaepidemi kan cirka 45% av skol- och dagisbarnen få influensa.
<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="16"><h3>Vad är en influensaepidemi?</h3></a>
<p>En epidemi uppstår när antalet fall av influensa i ett visst område är betydligt högre än antalet influensafall under resten av året.<br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<a name="17"><h3>Vad är en pandemi?</h3></a>
<p>En pandemi är en världsomfattande epidemi som orsakas av en ny virussubtyp. En ny subtyp uppstår när det sker en stor förändring av viruspartikelns yta med vilken slemhinnan i lungorna blir penetrerad. 

Eftersom de flesta människor inte har haft chansen att bli immuna mot den nya virussubtypen, kan smittan bli utbredd. <br /> 
<a href="#999">Tillbaka</a>
<br />
<hr />
<br />
<p>Har du fortfarande frågor? <a href="http://www.influensakoll.se/contact/">Kontakta oss.</a> </p>', '');
INSERT INTO snippet_snippet VALUES (23, 'filmkort_mitten', '<iframe width="420" height="315" src="http://www.youtube.com/embed/kn-RMWFs3vk" frameborder="0" allowfullscreen></iframe>', '');
INSERT INTO snippet_snippet VALUES (27, 'filmkort_vänster', '<iframe width="290" height="218" src="http://www.youtube.com/embed/kn-RMWFs3vk" frameborder="0" allowfullscreen></iframe>', '');
INSERT INTO snippet_snippet VALUES (24, 'filmlong', '<iframe width="420" height="315" src="http://www.youtube.com/embed/8svTNSngqpg" frameborder="0" allowfullscreen></iframe>', '');
INSERT INTO snippet_snippet VALUES (21, 'FragaromInfluensa', '<h1>Frågor och svar</h1>
<p>På den här sidan har vi samlat vanliga frågor och svar om influensa. Hoppas att du hittar vad du söker. Om inte eller om du har synpunkter är du välkommen att <a href="http://192.168.197.66/kontakta-oss/">kontakta 

oss.</a> </p>


<br />
<h3>Frågor om influensa och luftvägsinfektioner</h3>

<a name="top"><a href="#8">Vilka är symtomen på influensa?</a></a>
<br />
<a name="top"><a href="#9">Hur ser influensavirus ut?</a></a>
<br />
<a name="top"><a href="#10">Vad händer i kroppen när jag smittas av influensa?</a></a>
<br />
<a name="top"><a href="#11">Hur sprids influensavirus?</a></a>
<br />
<a name="top"><a href="#12">Hur kan man undvika att bli smittad?</a></a>
<br />
<a name="top"><a href="#13">Hur avgör läkaren om du har influensa?</a></a>
<br />
<a name="top"><a href="#14">Varför är det så att folk får influensa mest på vintern?</a></a>
<br />
<a name="top"><a href="#15">Är barn mindre motståndskraftiga mot influensa?</a></a>
<br />
<a name="top"><a href="#16">Vad är en influensaepidemi?</a></a>
<br />
<a name="top"><a href="#17">Vad är en pandemi?</a></a>
<br />
<hr /></p>
<p>
<br />
<h3>Frågor om influensa och luftvägsinfektioner</h3>
<a name="8">Vilka är symtomen på influensa?</a>
<p>Symtomen kommer ofta plötsligt och består av frossa, hög feber, huvudvärk, muskelvärk och hosta. Det värsta brukar vara över efter några dagar och efter någon vecka är många så friska att man kan återgå 

till arbetet, men hosta och trötthet kan hänga i ett tag.<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="9">Hur ser influensavirus ut?</a>
<p>Influensavirus är precis som alla virus: mycket, mycket litet. Enstaka virus ser ut som en mycket liten tennisboll med spik som sticker ut. Ett virus är 200 nanometer (0,2 miljondels meter) stort. 

Spikarna på utsidan är proteiner med vilka viruset kan tränga sig in i cellerna i de övre luftvägarna och sedan ut igen. <br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="10">Vad händer i kroppen när jag smittas av influensa?</a>
<p>Influensaviruset sätter sig i luftvägarna och skadar cellerna där.  Immunförsvaret känner snabbt att viruset är främmande för kroppen och en rad processer sätter igång som gör att vi känner oss sjuka i 

hela kroppen. Immunförsvarets vita blodkroppar aktiveras i blodet vid en infektion och skickar ut signaler som påverkar området i hjärnan som reglerar kroppstemperaturen vilket gör att vi får feber. Feber är 

ett av naturens sätt att göra miljön i kroppen otrivsam för viruset eftersom virus trivs bäst i 37 grader – den temperatur som de flesta har när de är friska.<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="11">Hur sprids influensavirus?</a>
<p>Influensavirus är ett luftburet virus som orsakar infektion i luftvägarna. Det smittar genom aerosol (små partiklar som bär viruset i luften), saliv- eller sekretdroppar eller kroppskontakt. Viruset tar 

sig in i luftvägarna genom inandningen. Från smittotillfället tar det 1-3 dygn innan man blir sjuk. 
<p>Influensasjukdom kan orsakas av två huvudtyper av influensavirus, influensavirus typ A och B. A-viruset är det som kan ge stora utbrott över hela världen. B-viruset ger mer begränsade utbrott. Sedan 

mitten på 70-talet har vi haft fyra virus, tre undertyper av influensa A och influensa B, som cirkulerar över världen. Dessa förändrar sig ständigt, och därför kan vi bli sjuka igen, trots att vi haft alla 

tre tidigare.<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="12">Hur kan man undvika att bli smittad?</a>
<p>Det är viktigt att den som är sjuk inte hostar och nyser rakt ut. Gör till en vana att alltid hosta och nysa i armvecket och använda pappersnäsdukar som sedan slängs i en soppåse. Handtvätt med tvål och 

vatten kan minska risken att en sjuk sprider smitta och att en frisk smittas. Komplettera gärna med handsprit. Hur vet man att man tvättat händerna tillräckligt länge? Ett tips är att tyst för sig själv 

sjunga ”Blinka lilla stjärna”. En vers tar cirka 20 sekunder vilket är tillräckligt länge. 
Om en person med misstänkt influensa måste träffa andra är det bra att hålla så stort avstånd som möjligt och att inte ta i hand eller kyssa på kind.  Friska personer bör om möjligt undvika närkontakt med 

misstänkta influensasjuka. Friska personer bör undvika att röra vid ögon, näsa och mun eftersom influensavirus kan ha fastnat på ett föremål som de nyligen rört vid.
<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="13">Hur avgör läkaren om du har influensa?</a>
<p>I allmänhet sätter läkaren sin diagnos baserat på de så kallade kliniska symtomen. Det kan vara svårt att skilja mellan influensa och andra luftvägsinfektioner. Om det verkligen är influensa kan säkrast 

konstateras genom virusprovtagning från näs- eller halsslem. Slemmet samlas upp med en bomullspinne och skickas till ett viruslaboratorium för analys. Under en influensaepidemi, har endast 60 till 70 % av 

dem som uppvisar symtom på influensa influensavirus.<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="14">Varför är det så att folk får influensa mest på vintern?</a>
<p>Influensavirus sprider sig lättast på vintern och början på våren. Man tror att detta beror på att människor oftare är inomhus och därmed närmare varandra under den "kalla årstiden". Dessutom är luften i 

ett hus under den kalla perioden ofta torr, som ett resultat av detta förblir influensavirus aktivt längre.
<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="15">Är barn mindre motståndskraftiga mot influensa?</a>
<p>Barn löper störst risk att få influensa dels för att deras immunsystem i allmänhet aldrig varit i kontakt med influensavirus innan. Dessutom smittar de varandra i skolan, dagis, etc. Under en 

influensaepidemi kan cirka 45% av skol- och dagisbarnen få influensa.
<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="16">Vad är en influensaepidemi?</a>
<p>En epidemi uppstår när antalet fall av influensa i ett visst område är betydligt högre än antalet influensafall under resten av året.<br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<a name="17">Vad är en pandemi? </a>
<p>En pandemi är en världsomfattande epidemi som orsakas av en ny virussubtyp. En ny subtyp uppstår när det sker en stor förändring av viruspartikelns yta med vilken slemhinnan i lungorna blir penetrerad. 

Eftersom de flesta människor inte har haft chansen att bli immuna mot den nya virussubtypen, kan smittan bli utbredd. <br /> 
<a href="#top">Tillbaka</a>
<br />
<hr />
<br />
<p>Har du fortfarande frågor? <a href="http://192.168.197.66/kontakta-oss/">Kontakta oss.</a> </p>', '');
INSERT INTO snippet_snippet VALUES (8, 'google_map', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Influensakoll</title>
<link rel="stylesheet" type="text/css" href="/+media-ggm/style.css"/>
<script type="text/javascript" src="/+media/jquery.js"></script>
<script type="text/javascript" src="/+media-ggm/ggm.js"></script>
<script type="text/javascript" src="/+media-ggm/influenzanetbar.js"></script>
   </head><body>

<script type="text/javascript" src="/+media-ggm/maps/js/polymaps.min.js"></script>

<div id="map_iw">
    <style type="text/css"> @import url("/+media-ggm/maps/css/map.css"); </style>
    <script type="text/javascript" src="/+media-ggm/maps/js/influensakoll_caps.js"></script>
<br class="clear"/>
</div>
</body></html>', '');
INSERT INTO snippet_snippet VALUES (19, 'google_map2', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>UK symptom map</title>
</head>
<body>

    <div id="cm-example" style="width: 500px; height: 750px"></div>

  <script type="text/javascript" src="http://tile.cloudmade.com/wml/latest/web-maps-lite.js"></script>
   <script type="text/javascript" src="/+media-ggm/maps/maps/maps/SV_latlong_symptoms.js"></script>
  
  <script type="text/javascript" src="/+media-ggm/maps/maps/maps/makemap_symptoms.js"></script>

</body>
</html>
', '');
INSERT INTO snippet_snippet VALUES (31, 'googleplus1_button', '<!-- Place this tag where you want the +1 button to render -->
<g:plusone annotation="none"></g:plusone>

<!-- Place this render call where appropriate -->
<script type="text/javascript">
  (function() {
    var po = document.createElement(''script''); po.type = ''text/javascript''; po.async = true;
    po.src = ''https://apis.google.com/js/plusone.js'';
    var s = document.getElementsByTagName(''script'')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>', '');
INSERT INTO snippet_snippet VALUES (39, 'GooglePlusBadge', '<!-- Place this tag in the <head> of your document -->
<link href="https://plus.google.com/109191795561126990370" rel="publisher" /><script type="text/javascript">
window.___gcfg = {lang: ''sv''};
(function() 
{var po = document.createElement("script");
po.type = "text/javascript"; po.async = true;po.src = "https://apis.google.com/js/plusone.js";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(po, s);
})();</script>

<!-- Place this tag where you want the badge to render -->
<g:plus href="https://plus.google.com/109191795561126990370" size="badge"></g:plus>', '');
INSERT INTO snippet_snippet VALUES (43, 'Hansvecka9', '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="475" height="77" id="srembeddedplayer" align="middle"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3802536%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><object name="flash" data="http://sverigesradio.se/api/flash/player_embed.swf?8" width="475" height="77" type="application/x-shockwave-flash"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3802536%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><param name="pluginurl" value="http://get.adobe.com/se/flashplayer/" /><a href="http://sverigesradio.se/topsy/ljudfil/3802536.m4a">Lyssna: Rekordmånga däckade i influensa</a></object></object>', '');
INSERT INTO snippet_snippet VALUES (6, 'hem', '<p>
<a href="http://192.168.197.66/om-influensakoll/">Läs mer om Influensakoll</a> 
</p>
<p>
<a href="http://192.168.197.66/accounts/register/">Gå med</a> 
</p>
<p>
<a href="http://192.168.197.66/accounts/login/">Logga in</a> 
</p>
<p>
<a href="http://192.168.197.66/survey/">Rapportera</a> 
</p>
<p>
<a href="http://192.168.197.66/influensaskola/">Influensaskola</a> 
</p>
<p>
<a href="http://192.168.197.66/faq/">FAQ</a> 
</p>
<br />
<br />
<br />
<br />
<a href="http://www.smittskyddsinstitutet.se/">
<img src="I:/Avdelningar/epi/_Project/sjukrapport/Admin/Epiwork/2010/influenzanet/influensakoll/bilder/SMI_color_mini.GIF" border="0" width="173" height="78"/>
</a></p>


', '');
INSERT INTO snippet_snippet VALUES (5, 'höger kolumn hem', '<p>
<a href="http://192.168.197.67/om-influensakoll/">Läs mer om Influensakoll</a> 
</p>
<p>
<a href="http://192.168.197.67/accounts/login/">Logga in</a> 
</p>
<p>
<a href="http://192.168.197.67/survey/">Rapportera</a> 
</p>
<p>
<a href="http://192.168.197.67/influensaskola/">Influensaskola</a> 
</p>
<p>
<a href="http://192.168.197.67/faq/">FAQ</a> 
</p>', '');
INSERT INTO snippet_snippet VALUES (7, 'horisontell linje', '<hr /></p>
', '');
INSERT INTO snippet_snippet VALUES (18, 'http://www.smittskyddsinstitutet.se/sjukdomar/forkylning/', '<a href="http://www.smittskyddsinstitutet.se/sjukdomar/forkylning/" target="_blank">http://www.smittskyddsinstitutet.se/sjukdomar/forkylning//</a> ', '');
INSERT INTO snippet_snippet VALUES (17, 'http://www.smittskyddsinstitutet.se/sjukdomar/influensa/', '<a href="http://www.smittskyddsinstitutet.se/sjukdomar/influensa/" target="_blank">http://www.smittskyddsinstitutet.se/sjukdomar/influensa/</a> 

', '');
INSERT INTO snippet_snippet VALUES (3, 'Influensa', '<html>
<head>
    <title>Influensa</title>
</head>
<body>

<font size=3>Influensa är en virussjukdom. Det finns tre typer av influensavirus; influensa A, B och C, som alla tillhör gruppen ortomyxovirus. Det är främst A och B som ger upphov till den typiska influensasjukdomen.<p>
Smittämnet finns i svalget hos den sjuke och sprids till andra främst som fin, luftburen droppsmitta (aerosol) men även genom kontakt. Smittsamheten är mycket stor. Inkubationstiden är kort, ett till tre dygn. Av inte helt klarlagda skäl är influensasjukligheten nästan helt koncentrerad till vintersäsongen. Man brukar tala om ”influensasäsongen”, som tidigast brukar bryta ut i oktober-november och vanligtvis inte sträcker sig längre än in i början av maj. Det finns emellertid en ganska stor variation i influensasäsongernas ”timing” och varaktighet. Under influensapandemin 2009 sågs influensa redan under sensommaren. Åren dessförinnan tog inte säsongen fart förrän efter nyår.<p>  
Influensa börjar ofta akut med frossa, snabbt stigande feber (ofta upp över 40°C), allmän muskelvärk, huvudvärk och därefter tilltagande symtom från luftvägarna, främst hosta. Ibland, och mest hos barn, förekommer symtom från mag- och tarmkanalen som kräkningar och diarré. Efter några dagar brukar tillståndet ge med sig och de flesta har tillfrisknat efter c:a 1 vecka. Sjukdomsbilden är ofta lindrigare än så och kan mer likna en vanlig förkylning.<p>
Behandlingen vid influensa är främst "symtomatisk", d.v.s. inte botande men symtomlindrande (t.ex. febernedsättande och inflammationsdämpande receptfria läkemedel med acetylsalicylsyra, paracetamol eller ibuprofen, näsdroppar, hostdämpande läkemedel etc.). Det finns antivirala medel som angriper det orsakande viruset, men effekten på sjukdomsförloppet är begränsad. För att sjukdomstiden ska förkortas måste antivirala medel ges tidigt i sjukdomsförloppet. Sådana medel kan även användas som profylax, d.v.s. de ges till ännu friska som utsatts för smitta för att förhindra att sjukdomen bryter ut. Baksidan är att virus kan utveckla motståndskraft mot antivirala medel, och om motståndskraftiga virus kommer i omlopp kan det bli till nackdel för alla. Därför används antivirala medel enbart i speciella situationer, t.ex. till riskgrupper som riskerar att få allvarliga komplikationer av influensan. Till de särskilda riskgrupperna räknas äldre personer (över 65 år), personer med allvarlig lungsjukdom som t.ex. astma, KOL eller emfysem, allvarlig hjärt- eller njursjukdom, diabetes, autoimmun sjukdom, eller med nedsatt immunförvar. För att minska behovet av antivirala medel även i dessa grupper erbjuds sådana personer förebyggande vaccination före varje ny influensasäsong. Den vanligaste komplikationen till influensa är att sjukdomsalstrande bakterier angriper de inflammerade luftvägarna så att en bakteriell lunginflammation uppstår. Att en bakteriell komplikation är på gång märker man på att symtomen (oftast febern och hostan), efter att först ha minskat successivt, verkar ta ny fart på femte eller sjätte dagen. Bakteriella komplikationer kräver läkarbedömning och behandlas med antibiotika.<p>
Influensavirus är mycket föränderligt, och därför kan man insjukna i influensa flera gånger. Ibland räcker skyddet helt eller delvis under några års tid. Ibland, då influensavirus ändrat skepnad totalt, blir alla helt mottagliga. Senast hände detta i världen 2009 då den nya influensan började spridas världen över. Mer om immunitet mot influensan finner du under avsnittet Pandemier [länk]. Vill du veta mer om hur influensan ändrar skepnad från år till år kan du titta på en video med Annika Lindes influensaskola [länk] (xx minuter).  <p>
Har du frågor om influensa? I influensakolls FAQ [länk] hittar du svar på vanliga frågor.<p>

Du kan också läsa mer om influensa på <a href=''http://www.smittskyddsinstitutet.se/sjukdomar/influensa/</a><p>
', '');
INSERT INTO snippet_snippet VALUES (37, 'kossornasplanet', '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="475" height="77" id="srembeddedplayer" align="middle"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3718708%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><object name="flash" data="http://sverigesradio.se/api/flash/player_embed.swf?8" width="475" height="77" type="application/x-shockwave-flash"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3718708%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><param name="pluginurl" value="http://get.adobe.com/se/flashplayer/" /><a href="http://sverigesradio.se/topsy/ljudfil/3718708.m4a">Lyssna: Influensakoll</a></object></object>', '');
INSERT INTO snippet_snippet VALUES (12, 'länk till "ga med"', '<a href="/accounts/register/">gå med</a> 

', '');
INSERT INTO snippet_snippet VALUES (13, 'länk till "gå med" G', '<a href="/sv/accounts/register/">Gå med</a> ', '');
INSERT INTO snippet_snippet VALUES (14, 'länk till "gå med" skapa användarkonto', '<a href="/accounts/register/">Skapa ett användarkonto</a> ', '');
INSERT INTO snippet_snippet VALUES (20, 'link till Profil', '<a href="../survey/people/">välja profilnamn och fylla i bakgrundsformuläret</a> ', '');
INSERT INTO snippet_snippet VALUES (10, 'loggor_nederkant', '<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<a href="http://www.smittskyddsinstitutet.se/">
<img src="/+media/images/SMI_Small_ny_logotyp_2011.gif" border="0" width="173" height="78"/>
</a></p>
<br />
<br />
<br />
<a href="http://ki.se/">
<img src="/+media/images/KIlogo.gif" border="0" width="164" height="68"/>
</a></p>
<br />


', '');
INSERT INTO snippet_snippet VALUES (11, 'loggor_överkant', '<br />
<a href="http://www.smittskyddsinstitutet.se/">
<img src="/media/cms_page_media/SMI_Small_ny_logotyp_2011.gif" border="0" width="173" height="78"/>
</a></p>


<br />
<a href="http://ki.se/">
<img src="/media/cms_page_media/KIlogo.gif" border="0" width="164" height="68"/>
</a></p>
', '');
INSERT INTO snippet_snippet VALUES (42, 'P4Vasternorrland24feb', '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="475" height="77" id="srembeddedplayer" align="middle"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3dbroadcast%26id%3d3790069%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><object name="flash" data="http://sverigesradio.se/api/flash/player_embed.swf?8" width="475" height="77" type="application/x-shockwave-flash"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3dbroadcast%26id%3d3790069%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><param name="pluginurl" value="http://get.adobe.com/se/flashplayer/" /><a href="http://sverigesradio.se/topsy/ljudfil/3790069.m4a">Lyssna: 15.00 - 15.30 fredag 24 feb 2012</a></object></object>', '');
INSERT INTO snippet_snippet VALUES (33, 'Poll_fraga', '<form method=post action="http://poll.pollcode.com/PQAe"><table border=0 width=150 bgcolor="EEEEEE" cellspacing=2 cellpadding=0><tr><td colspan=2><font face="Verdana" size=-1 color="000000"><b>Spanska sjukan var en av de tre stora pandemierna under 1900-talet. Vad kallades de andra två?</b></font></td></tr><tr><td width=5><input type=radio name=answer value="1"></td><td>&nbsp;<font face="Verdana" size=-1 color="000000">Asiaten och Svininfluensan</font></td></tr><tr><td width=5><input type=radio name=answer value="2"></td><td>&nbsp;<font face="Verdana" size=-1 color="000000">Hongkonginfluensan och Fågelinfluensan</font></td></tr><tr><td width=5><input type=radio name=answer value="3"></td><td>&nbsp;<font face="Verdana" size=-1 color="000000">Asiaten och Hongkonginfluensan</font></td></tr><tr><td width=5><input type=radio name=answer value="4"></td><td>&nbsp;<font face="Verdana" size=-1 color="000000">Svininfluensan och Fågelinfluensan</font></td></tr><tr><td colspan=2><center><input type=submit value="Vote">&nbsp;&nbsp;<input type=submit name=view value="View"></center></td></tr><tr><td colspan=2 align=right><font face="Verdana" size=-2 color="black">pollcode.com <a href=http://pollcode.com/>free polls</a>&nbsp;</font></td></tr></table></form>
', '');
INSERT INTO snippet_snippet VALUES (34, 'Poll_fraga2', '<div id="qp_main70846" style="border:1px solid black;margin:10px;padding:10px;padding-bottom:12px;background-color:rgb(185,0,36)"><div style="font-family:Arial;font-size:12px;font-weight:bold;background-color:rgb(108,0,10);width:100%;color:white"><div style="padding:10px">Vad är en pandemi?</div></div><form id="qp_form70846" action="http://poll.learnmyself.com/results70846xafB342C4" method="post" target="_blank" style="padding:0px;margin-top:10px"><div style="width:100%"><div style="display:block;font-family:Arial;font-size:12px;color:white;padding-top:5px;padding-bottom:5px;clear:both;width:100%"><span style="display:block;padding-left:30px"><input style="float:left;width:25px;margin-left:-25px;margin-top:-1px;padding:0px;height:18px" name="qp_v70846" type="radio" value="1">Ett utbrott av en sjukdom i en viss region</span></div><div style="display:block;font-family:Arial;font-size:12px;color:white;padding-top:5px;padding-bottom:5px;clear:both;width:100%"><span style="display:block;padding-left:30px"><input style="float:left;width:25px;margin-left:-25px;margin-top:-1px;padding:0px;height:18px" name="qp_v70846" type="radio" value="2">Ett världsomspännande utbrott av en sjukdom</span></div><div style="display:block;font-family:Arial;font-size:12px;color:white;padding-top:5px;padding-bottom:5px;clear:both;width:100%"><span style="display:block;padding-left:30px"><input style="float:left;width:25px;margin-left:-25px;margin-top:-1px;padding:0px;height:18px" name="qp_v70846" type="radio" value="3">Ett sjukdomsutbrott där mer än hälften av de smittade människorna dör</span></div><div style="display:block;font-family:Arial;font-size:12px;color:white;padding-top:5px;padding-bottom:5px;clear:both;width:100%"><span style="display:block;padding-left:30px"><input style="float:left;width:25px;margin-left:-25px;margin-top:-1px;padding:0px;height:18px" name="qp_v70846" type="radio" value="4">Ett utbrott av en sjukdom som varar i minst tre månader</span></div></div><div style="padding-top:10px;clear:both"><input name="qp_b70846" style="width:80px;margin-right:5px" type="submit" value="Rösta"><input name="qp_b70846" style="width:80px;margin-right:5px" type="submit" value="Resultat"></div><span style="background-image:url(http://imgs.learnmyself.com/p70846xafB342C4_0_0.gif);"></span></form></div><script src="http://scripts.learnmyself.com/3001/scpolls.js" language="javascript"></script>', '');
INSERT INTO snippet_snippet VALUES (16, '<p></p>', '<p></p>
<p></p>', '');
INSERT INTO snippet_snippet VALUES (22, 'quiz', '<?xml version="1.0"?>
       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "xhtml11.dtd">
       <html xmlns="http://www.w3.org/1999/xhtml"
             xml:lang="en"><head><meta name="author" content="Created with Hot Potatoes by Half-Baked Software, registered to annasara."></meta><meta name="keywords" content="Hot Potatoes, Hot Potatoes, Half-Baked Software, Windows, University of Victoria"></meta>

<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />
<meta name="DC:Creator" content="annasara" />
<meta name="DC:Title" content="Fr&#x00E5;gesport om influensa!" />


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 

<title>
Fr&#x00E5;gesport om influensa!
</title>

<!-- Made with executable version 6.3 Release 0 Build 4 -->

<!-- The following insertion allows you to add your own code directly to this head tag from the configuration screen -->



<style type="text/css">


/* This is the CSS stylesheet used in the exercise. */
/* Elements in square brackets are replaced by data based on configuration settings when the exercise is built. */

/* BeginCorePageCSS */

/* Made with executable version 6.3 Release 0 Build 4 */


/* Hack to hide a nested Quicktime player from IE, which can''t handle it. */
* html object.MediaPlayerNotForIE {
	display: none;
}

body{
	font-family: Geneva,Arial,sans-serif;
	background-color: #c0c0c0;
	color: #000000;
 
	margin-right: 5%;
	margin-left: 5%;
	font-size: small;
}

p{
	text-align: left;
	margin: 0px;
	font-size: 100%;
}

table,div,span,td{
	font-size: 100%;
	color: #000000;
}

div.Titles{
	padding: 0.5em;;
	text-align: center;
	color: #000000;
}

button{
	font-family: Geneva,Arial,sans-serif;
	font-size: 100%;
	display: inline;
}

.ExerciseTitle{
	font-size: 140%;
	color: #000000;
}

.ExerciseSubtitle{
	font-size: 120%;
	color: #000000;
}

div.StdDiv{
	background-color: #ffffff;
	text-align: center;
	font-size: 100%;
	color: #000000;
	padding: 0.5em;
	border-style: solid;
	border-width: 1px 1px 1px 1px;
	border-color: #000000;
	margin-bottom: 1px;
}

/* EndCorePageCSS */

.RTLText{
	text-align: right;
	font-size: 150%;
	direction: rtl;
	font-family: "Simplified Arabic", "Traditional Arabic", "Times New Roman", Geneva,Arial,sans-serif; 
}

.CentredRTLText{
	text-align: center;
	font-size: 150%;
	direction: rtl;
	font-family: "Simplified Arabic", "Traditional Arabic", "Times New Roman", Geneva,Arial,sans-serif; 
}

button p.RTLText{
	text-align: center;
}

.RTLGapBox{
	text-align: right;
	font-size: 150%;
	direction: rtl;
	font-family: "Times New Roman", Geneva,Arial,sans-serif;
}

.Guess{
	font-weight: bold;
}

.CorrectAnswer{
	font-weight: bold;
}

div#Timer{
	padding: 0.25em;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	color: #000000;
}

span#TimerText{
	padding: 0.25em;
	border-width: 1px;
	border-style: solid;
	font-weight: bold;
	display: none;
	color: #000000;
}

span.Instructions{

}

div.ExerciseText{

}

.FeedbackText, .FeedbackText span.CorrectAnswer, .FeedbackText span.Guess, .FeedbackText span.Answer{
	color: #000000;
}

.LeftItem{
	font-size: 100%;
	color: #000000;
	text-align: left;
}

.RightItem{
	font-weight: bold;
	font-size: 100%;
	color: #000000;
}

span.CorrectMark{

}

input, textarea{
	font-family: Geneva,Arial,sans-serif;
	font-size: 120%;
}

select{
	font-size: 100%;
}

div.Feedback {
	background-color: #c0c0c0;
	left: 33%;
	width: 34%;
	top: 33%;
	z-index: 1;
	border-style: solid;
	border-width: 1px;
	padding: 5px;
	text-align: center;
	color: #000000;
	position: absolute;
	display: none;
	font-size: 100%;
}




div.ExerciseDiv{
	color: #000000;
}

/* JMatch flashcard styles */
table.FlashcardTable{
	background-color: transparent;
	color: #000000;
	border-color: #000000;
	margin-left: 5%;
	margin-right: 5%;
	margin-top: 2em;
	margin-bottom: 2em;
	width: 90%;
	position: relative;
	text-align: center;
	padding: 0px;
}

table.FlashcardTable tr{
	border-style: none;
	margin: 0px;
	padding: 0px;
	background-color: #ffffff;
}

table.FlashcardTable td.Showing{
	font-size: 140%;
	text-align: center;
	width: 50%;
	display: table-cell;
	padding: 2em;
	margin: 0px;
	border-style: solid;
	border-width: 1px;
	color: #000000;
	background-color: #ffffff;
}

table.FlashcardTable td.Hidden{
	display: none;
}

/* JMix styles */
div#SegmentDiv{
	margin-top: 2em;
	margin-bottom: 2em;
	text-align: center;
}

a.ExSegment{
	font-size: 120%;
	font-weight: bold;
	text-decoration: none;
	color: #000000;
}

span.RemainingWordList{
	font-style: italic;
}

div.DropLine {
	position: absolute;
	text-align: center;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-bottom-color: #000000;
	width: 80%;
}

/* JCloze styles */

.ClozeWordList{
	text-align: center;
	font-weight: bold;
}

div.ClozeBody{
	text-align: left;
	margin-top: 2em;
	margin-bottom: 2em;
	line-height: 2.0
}

span.GapSpan{
	font-weight: bold;
}

/* JCross styles */

table.CrosswordGrid{
	margin: auto auto 1em auto;
	border-collapse: collapse;
	padding: 0px;
	background-color: #000000;
}

table.CrosswordGrid tbody tr td{
	width: 1.5em;
	height: 1.5em;
	text-align: center;
	vertical-align: middle;
	font-size: 140%;
	padding: 1px;
	margin: 0px;
	border-style: solid;
	border-width: 1px;
	border-color: #000000;
	color: #000000;
}

table.CrosswordGrid span{
	color: #000000;
}

table.CrosswordGrid td.BlankCell{
	background-color: #000000;
	color: #000000;
}

table.CrosswordGrid td.LetterOnlyCell{
	text-align: center;
	vertical-align: middle;
	background-color: #ffffff;
	color: #000000;
	font-weight: bold;
}

table.CrosswordGrid td.NumLetterCell{
	text-align: left;
	vertical-align: top;
	background-color: #ffffff;
	color: #000000;
	padding: 1px;
	font-weight: bold;
}

.NumLetterCellText{
	cursor: pointer;
	color: #000000;
}

.GridNum{
	vertical-align: super;
	font-size: 66%;
	font-weight: bold;
	text-decoration: none;
	color: #000000;
}

.GridNum:hover, .GridNum:visited{
	color: #000000;
}

table#Clues{
	margin: auto;
	vertical-align: top;
}

table#Clues td{
	vertical-align: top;
}

table.ClueList{
  margin: auto;
}

td.ClueNum{
	text-align: right;
	font-weight: bold;
	vertical-align: top;
}

td.Clue{
	text-align: left;
}

div#ClueEntry{
	text-align: left;
	margin-bottom: 1em;
}

/* Keypad styles */

div.Keypad{
	text-align: center;
	display: none; /* initially hidden, shown if needed */
	margin-bottom: 0.5em;
}

div.Keypad button{
	font-family: Geneva,Arial,sans-serif;
	font-size: 120%;
	background-color: #ffffff;
	color: #000000;
	width: 2em;
}

/* JQuiz styles */

div.QuestionNavigation{
	text-align: center;
}

.QNum{
	margin: 0em 1em 0.5em 1em;
	font-weight: bold;
	vertical-align: middle;
}

textarea{
	font-family: Geneva,Arial,sans-serif;
}

.QuestionText{
	text-align: left;
	margin: 0px;
	font-size: 100%;
}

.Answer{
	font-size: 120%;
	letter-spacing: 0.1em;
}

.PartialAnswer{
	font-size: 120%;
	letter-spacing: 0.1em;
	color: #000000;
}

.Highlight{
	color: #000000;
	background-color: #ffff00;
	font-weight: bold;
	font-size: 120%;
}

ol.QuizQuestions{
	text-align: left;
	list-style-type: none;
}

li.QuizQuestion{
	padding: 1em;
	border-style: solid;
	border-width: 0px 0px 1px 0px;
}

ol.MCAnswers{
	text-align: left;
	list-style-type: upper-alpha;
	padding: 1em;
}

ol.MCAnswers li{
	margin-bottom: 1em;
}

ol.MSelAnswers{
	text-align: left;
	list-style-type: lower-alpha;
	padding: 1em;
}

div.ShortAnswer{
	padding: 1em;
}

.FuncButton {
	text-align: center;
	border-style: solid;

	border-left-color: #ffffff;
	border-top-color: #ffffff;
	border-right-color: #7f7f7f;
	border-bottom-color: #7f7f7f;
	color: #000000;
	background-color: #ffffff;

	border-width: 2px;
	padding: 3px 6px 3px 6px;
	cursor: pointer;
}

.FuncButtonUp {
	color: #ffffff;
	text-align: center;
	border-style: solid;

	border-left-color: #ffffff;
	border-top-color: #ffffff;
	border-right-color: #7f7f7f;
	border-bottom-color: #7f7f7f;

	background-color: #000000;
	color: #ffffff;
	border-width: 2px;
	padding: 3px 6px 3px 6px;
	cursor: pointer;
}

.FuncButtonDown {
	color: #ffffff;
	text-align: center;
	border-style: solid;

	border-left-color: #7f7f7f;
	border-top-color: #7f7f7f;
	border-right-color: #ffffff;
	border-bottom-color: #ffffff;
	background-color: #000000;
	color: #ffffff;

	border-width: 2px;
	padding: 3px 6px 3px 6px;
	cursor: pointer;
}

/*BeginNavBarStyle*/

div.NavButtonBar{
	background-color: #2c2c2c;
	text-align: center;
	margin: 2px 0px 2px 0px;
	clear: both;
	font-size: 100%;
}

.NavButton {
	border-style: solid;
	
	border-left-color: #959595;
	border-top-color: #959595;
	border-right-color: #161616;
	border-bottom-color: #161616;
	background-color: #2c2c2c;
	color: #ffffff;

	border-width: 2px;
	cursor: pointer;	
}

.NavButtonUp {
	border-style: solid;

	border-left-color: #959595;
	border-top-color: #959595;
	border-right-color: #161616;
	border-bottom-color: #161616;
	color: #2c2c2c;
	background-color: #ffffff;

	border-width: 2px;
	cursor: pointer;	
}

.NavButtonDown {
	border-style: solid;

	border-left-color: #161616;
	border-top-color: #161616;
	border-right-color: #959595;
	border-bottom-color: #959595;
	color: #2c2c2c;
	background-color: #ffffff;

	border-width: 2px;
	cursor: pointer;	
}

/*EndNavBarStyle*/

a{
	color: #ff0080;
}

a:visited{
	color: #808080;
}

a:hover{
	color: #ff0080;
}

div.CardStyle {
	position: absolute;
	font-family: Geneva,Arial,sans-serif;
	font-size: 100%;
	padding: 5px;
	border-style: solid;
	border-width: 1px;
	color: #000000;
	background-color: #ffffff;
	left: -50px;
	top: -50px;
	overflow: visible;
}

.rtl{
	text-align: right;
	font-size: 140%;
}


</style>

<script type="text/javascript">

//<![CDATA[

<!--




function Client(){
//if not a DOM browser, hopeless
	this.min = false; if (document.getElementById){this.min = true;};

	this.ua = navigator.userAgent;
	this.name = navigator.appName;
	this.ver = navigator.appVersion;  

//Get data about the browser
	this.mac = (this.ver.indexOf(''Mac'') != -1);
	this.win = (this.ver.indexOf(''Windows'') != -1);

//Look for Gecko
	this.gecko = (this.ua.indexOf(''Gecko'') > 1);
	if (this.gecko){
		this.geckoVer = parseInt(this.ua.substring(this.ua.indexOf(''Gecko'')+6, this.ua.length));
		if (this.geckoVer < 20020000){this.min = false;}
	}
	
//Look for Firebird
	this.firebird = (this.ua.indexOf(''Firebird'') > 1);
	
//Look for Safari
	this.safari = (this.ua.indexOf(''Safari'') > 1);
	if (this.safari){
		this.gecko = false;
	}
	
//Look for IE
	this.ie = (this.ua.indexOf(''MSIE'') > 0);
	if (this.ie){
		this.ieVer = parseFloat(this.ua.substring(this.ua.indexOf(''MSIE'')+5, this.ua.length));
		if (this.ieVer < 5.5){this.min = false;}
	}
	
//Look for Opera
	this.opera = (this.ua.indexOf(''Opera'') > 0);
	if (this.opera){
		this.operaVer = parseFloat(this.ua.substring(this.ua.indexOf(''Opera'')+6, this.ua.length));
		if (this.operaVer < 7.04){this.min = false;}
	}
	if (this.min == false){
		alert(''Your browser may not be able to handle this page.'');
	}
	
//Special case for the horrible ie5mac
	this.ie5mac = (this.ie&&this.mac&&(this.ieVer<6));
}

var C = new Client();

//for (prop in C){
//	alert(prop + '': '' + C[prop]);
//}



//CODE FOR HANDLING NAV BUTTONS AND FUNCTION BUTTONS

//[strNavBarJS]
function NavBtnOver(Btn){
	if (Btn.className != ''NavButtonDown''){Btn.className = ''NavButtonUp'';}
}

function NavBtnOut(Btn){
	Btn.className = ''NavButton'';
}

function NavBtnDown(Btn){
	Btn.className = ''NavButtonDown'';
}
//[/strNavBarJS]

function FuncBtnOver(Btn){
	if (Btn.className != ''FuncButtonDown''){Btn.className = ''FuncButtonUp'';}
}

function FuncBtnOut(Btn){
	Btn.className = ''FuncButton'';
}

function FuncBtnDown(Btn){
	Btn.className = ''FuncButtonDown'';
}

function FocusAButton(){
	if (document.getElementById(''CheckButton1'') != null){
		document.getElementById(''CheckButton1'').focus();
	}
	else{
		if (document.getElementById(''CheckButton2'') != null){
			document.getElementById(''CheckButton2'').focus();
		}
		else{
			document.getElementsByTagName(''button'')[0].focus();
		}
	}
}




//CODE FOR HANDLING DISPLAY OF POPUP FEEDBACK BOX

var topZ = 1000;

function ShowMessage(Feedback){
	var Output = Feedback + ''<br /><br />'';
	document.getElementById(''FeedbackContent'').innerHTML = Output;
	var FDiv = document.getElementById(''FeedbackDiv'');
	topZ++;
	FDiv.style.zIndex = topZ;
	FDiv.style.top = TopSettingWithScrollOffset(30) + ''px'';

	FDiv.style.display = ''block'';

	ShowElements(false, ''input'');
	ShowElements(false, ''select'');
	ShowElements(false, ''object'');
	ShowElements(true, ''object'', ''FeedbackContent'');

//Focus the OK button
	setTimeout("document.getElementById(''FeedbackOKButton'').focus()", 50);
	
//
}

function ShowElements(Show, TagName, ContainerToReverse){
// added third argument to allow objects in the feedback box to appear
//IE bug -- hide all the form elements that will show through the popup
//FF on Mac bug : doesn''t redisplay objects whose visibility is set to visible
//unless the object''s display property is changed

	//get container object (by Id passed in, or use document otherwise)
	TopNode = document.getElementById(ContainerToReverse);
	var Els;
	if (TopNode != null) {
		Els = TopNode.getElementsByTagName(TagName);
	} else {
		Els = document.getElementsByTagName(TagName);
	}

	for (var i=0; i<Els.length; i++){
		if (TagName == "object") {
			//manipulate object elements in all browsers
			if (Show == true){
				Els[i].style.visibility = ''visible'';
				//get Mac FireFox to manipulate display, to force screen redraw
				if (C.mac && C.gecko) {Els[i].style.display = '''';}
			}
			else{
				Els[i].style.visibility = ''hidden'';
				if (C.mac && C.gecko) {Els[i].style.display = ''none'';}
			}
		} 
		else {
			// tagName is either input or select (that is, Form Elements)
			// ie6 has a problem with Form elements, so manipulate those
			if (C.ie) {
				if (C.ieVer < 7) {
					if (Show == true){
						Els[i].style.visibility = ''visible'';
					}
					else{
						Els[i].style.visibility = ''hidden'';
					}
				}
			}
		}
	}
}



function HideFeedback(){
	document.getElementById(''FeedbackDiv'').style.display = ''none'';
	ShowElements(true, ''input'');
	ShowElements(true, ''select'');
	ShowElements(true, ''object'');
	if (Finished == true){
		Finish();
	}
}


//GENERAL UTILITY FUNCTIONS AND VARIABLES

//PAGE DIMENSION FUNCTIONS
function PageDim(){
//Get the page width and height
	this.W = 600;
	this.H = 400;
	this.W = document.getElementsByTagName(''body'')[0].clientWidth;
	this.H = document.getElementsByTagName(''body'')[0].clientHeight;
}

var pg = null;

function GetPageXY(El) {
	var XY = {x: 0, y: 0};
	while(El){
		XY.x += El.offsetLeft;
		XY.y += El.offsetTop;
		El = El.offsetParent;
	}
	return XY;
}

function GetScrollTop(){
	if (typeof(window.pageYOffset) == ''number''){
		return window.pageYOffset;
	}
	else{
		if ((document.body)&&(document.body.scrollTop)){
			return document.body.scrollTop;
		}
		else{
			if ((document.documentElement)&&(document.documentElement.scrollTop)){
				return document.documentElement.scrollTop;
			}
			else{
				return 0;
			}
		}
	}
}

function GetViewportHeight(){
	if (typeof window.innerHeight != ''undefined''){
		return window.innerHeight;
	}
	else{
		if (((typeof document.documentElement != ''undefined'')&&(typeof document.documentElement.clientHeight !=
     ''undefined''))&&(document.documentElement.clientHeight != 0)){
			return document.documentElement.clientHeight;
		}
		else{
			return document.getElementsByTagName(''body'')[0].clientHeight;
		}
	}
}

function TopSettingWithScrollOffset(TopPercent){
	var T = Math.floor(GetViewportHeight() * (TopPercent/100));
	return GetScrollTop() + T; 
}

//CODE FOR AVOIDING LOSS OF DATA WHEN BACKSPACE KEY INVOKES history.back()
var InTextBox = false;

function SuppressBackspace(e){ 
	if (InTextBox == true){return;}
	if (C.ie) {
		thisKey = window.event.keyCode;
	}
	else {
		thisKey = e.keyCode;
	}

	var Suppress = false;

	if (thisKey == 8) {
		Suppress = true;
	}

	if (Suppress == true){
		if (C.ie){
			window.event.returnValue = false;	
			window.event.cancelBubble = true;
		}
		else{
			e.preventDefault();
		}
	}
}

if (C.ie){
	document.attachEvent(''onkeydown'',SuppressBackspace);
	window.attachEvent(''onkeydown'',SuppressBackspace);
}
else{
	if (window.addEventListener){
		window.addEventListener(''keypress'',SuppressBackspace,false);
	}
}

function ReduceItems(InArray, ReduceToSize){
	var ItemToDump=0;
	var j=0;
	while (InArray.length > ReduceToSize){
		ItemToDump = Math.floor(InArray.length*Math.random());
		InArray.splice(ItemToDump, 1);
	}
}

function Shuffle(InArray){
	var Num;
	var Temp = new Array();
	var Len = InArray.length;

	var j = Len;

	for (var i=0; i<Len; i++){
		Temp[i] = InArray[i];
	}

	for (i=0; i<Len; i++){
		Num = Math.floor(j  *  Math.random());
		InArray[i] = Temp[Num];

		for (var k=Num; k < (j-1); k++) {
			Temp[k] = Temp[k+1];
		}
		j--;
	}
	return InArray;
}

function WriteToInstructions(Feedback) {
	document.getElementById(''InstructionsDiv'').innerHTML = Feedback;

}




function EscapeDoubleQuotes(InString){
	return InString.replace(/"/g, ''&quot;'')
}

function TrimString(InString){
        var x = 0;

        if (InString.length != 0) {
                while ((InString.charAt(InString.length - 1) == ''\u0020'') || (InString.charAt(InString.length - 1) == ''\u000A'') || (InString.charAt(InString.length - 1) == ''\u000D'')){
                        InString = InString.substring(0, InString.length - 1)
                }

                while ((InString.charAt(0) == ''\u0020'') || (InString.charAt(0) == ''\u000A'') || (InString.charAt(0) == ''\u000D'')){
                        InString = InString.substring(1, InString.length)
                }

                while (InString.indexOf(''  '') != -1) {
                        x = InString.indexOf(''  '')
                        InString = InString.substring(0, x) + InString.substring(x+1, InString.length)
                 }

                return InString;
        }

        else {
                return '''';
        }
}

function FindLongest(InArray){
	if (InArray.length < 1){return -1;}

	var Longest = 0;
	for (var i=1; i<InArray.length; i++){
		if (InArray[i].length > InArray[Longest].length){
			Longest = i;
		}
	}
	return Longest;
}

//UNICODE CHARACTER FUNCTIONS
function IsCombiningDiacritic(CharNum){
	var Result = (((CharNum >= 0x0300)&&(CharNum <= 0x370))||((CharNum >= 0x20d0)&&(CharNum <= 0x20ff)));
	Result = Result || (((CharNum >= 0x3099)&&(CharNum <= 0x309a))||((CharNum >= 0xfe20)&&(CharNum <= 0xfe23)));
	return Result;
}

function IsCJK(CharNum){
	return ((CharNum >= 0x3000)&&(CharNum < 0xd800));
}

//SETUP FUNCTIONS
//BROWSER WILL REFILL TEXT BOXES FROM CACHE IF NOT PREVENTED
function ClearTextBoxes(){
	var NList = document.getElementsByTagName(''input'');
	for (var i=0; i<NList.length; i++){
		if ((NList[i].id.indexOf(''Guess'') > -1)||(NList[i].id.indexOf(''Gap'') > -1)){
			NList[i].value = '''';
		}
		if (NList[i].id.indexOf(''Chk'') > -1){
			NList[i].checked = '''';
		}
	}
}

//EXTENSION TO ARRAY OBJECT
function Array_IndexOf(Input){
	var Result = -1;
	for (var i=0; i<this.length; i++){
		if (this[i] == Input){
			Result = i;
		}
	}
	return Result;
}
Array.prototype.indexOf = Array_IndexOf;

//IE HAS RENDERING BUG WITH BOTTOM NAVBAR
function RemoveBottomNavBarForIE(){
	if ((C.ie)&&(document.getElementById(''Reading'') != null)){
		if (document.getElementById(''BottomNavBar'') != null){
			document.getElementById(''TheBody'').removeChild(document.getElementById(''BottomNavBar''));
		}
	}
}




//HOTPOTNET-RELATED CODE

var HPNStartTime = (new Date()).getTime();
var SubmissionTimeout = 30000;
var Detail = ''''; //Global that is used to submit tracking data

function Finish(){
//If there''s a form, fill it out and submit it
	if (document.store != null){
		Frm = document.store;
		Frm.starttime.value = HPNStartTime;
		Frm.endtime.value = (new Date()).getTime();
		Frm.mark.value = Score;
		Frm.detail.value = Detail;
		Frm.submit();
	}
}





//JQUIZ CORE JAVASCRIPT CODE

var CurrQNum = 0;
var CorrectIndicator = ''r&#x00E4;tt'';
var IncorrectIndicator = ''fel'';
var YourScoreIs = ''Ditt betyg: '';

//New for 6.2.2.0
var CompletedSoFar = ''Fr&#x00E5;gor du besvarat helt: '';
var ExerciseCompleted = ''Nu &#x00E4;r du klar med fr&#x00E5;gan.'';
var ShowCompletedSoFar = true;

var ContinuousScoring = true;
var CorrectFirstTime = ''Fr&#x00E5;gor som du klarade f&#x00F6;rsta g&#x00E5;ngen: '';
var ShowCorrectFirstTime = true;
var ShuffleQs = true;
var ShuffleAs = true;
var DefaultRight = ''Korrekt!'';
var DefaultWrong = ''Nej, f&#x00F6;rs&#x00F6;k igen!'';
var QsToShow = 14;
var Score = 0;
var Finished = false;
var Qs = null;
var QArray = new Array();
var ShowingAllQuestions = false;
var ShowAllQuestionsCaption = ''Visa alla fr&#x00E5;gor och dina svar'';
var ShowOneByOneCaption = ''Visa fr&#x00E5;gorna en och en'';
var State = new Array();
var Feedback = '''';
var TimeOver = false;
var strInstructions = '''';
var Locked = false;

//The following variable can be used to add a message explaining that
//the question is finished, so no further marking will take place.
var strQuestionFinished = '''';

function CompleteEmptyFeedback(){
	var QNum, ANum;
	for (QNum=0; QNum<I.length; QNum++){
//Only do this if not multi-select
		if (I[QNum][2] != ''3''){
  		for (ANum = 0; ANum<I[QNum][3].length; ANum++){
  			if (I[QNum][3][ANum][1].length < 1){
  				if (I[QNum][3][ANum][2] > 0){
  					I[QNum][3][ANum][1] = DefaultRight;
  				}
  				else{
  					I[QNum][3][ANum][1] = DefaultWrong;
  				}
  			}
  		}
		}
	}
}

function SetUpQuestions(){
	var AList = new Array(); 
	var QList = new Array();
	var i, j;
	Qs = document.getElementById(''Questions'');
	while (Qs.getElementsByTagName(''li'').length > 0){
		QList.push(Qs.removeChild(Qs.getElementsByTagName(''li'')[0]));
	}
	var DumpItem = 0;
	if (QsToShow > QList.length){
		QsToShow = QList.length;
	}
	while (QsToShow < QList.length){
		DumpItem = Math.floor(QList.length*Math.random());
		for (j=DumpItem; j<(QList.length-1); j++){
			QList[j] = QList[j+1];
		}
		QList.length = QList.length-1;
	}
	if (ShuffleQs == true){
		QList = Shuffle(QList);
	}
	if (ShuffleAs == true){
		var As;
		for (var i=0; i<QList.length; i++){
			As = QList[i].getElementsByTagName(''ol'')[0];
			if (As != null){
  			AList.length = 0;
				while (As.getElementsByTagName(''li'').length > 0){
					AList.push(As.removeChild(As.getElementsByTagName(''li'')[0]));
				}
				AList = Shuffle(AList);
				for (j=0; j<AList.length; j++){
					As.appendChild(AList[j]);
				}
			}
		}
	}
	
	for (i=0; i<QList.length; i++){
		Qs.appendChild(QList[i]);
		QArray[QArray.length] = QList[i];
	}

//Show the first item
	QArray[0].style.display = '''';
	
//Now hide all except the first item
	for (i=1; i<QArray.length; i++){
		QArray[i].style.display = ''none'';
	}		
	SetQNumReadout();
	
	SetFocusToTextbox();
}

function SetFocusToTextbox(){
//if there''s a textbox, set the focus in it
	if (QArray[CurrQNum].getElementsByTagName(''input'')[0] != null){
		QArray[CurrQNum].getElementsByTagName(''input'')[0].focus();
//and show a keypad if there is one
		if (document.getElementById(''CharacterKeypad'') != null){
			document.getElementById(''CharacterKeypad'').style.display = ''block'';
		}
	}
	else{
  	if (QArray[CurrQNum].getElementsByTagName(''textarea'')[0] != null){
  		QArray[CurrQNum].getElementsByTagName(''textarea'')[0].focus();	
//and show a keypad if there is one
			if (document.getElementById(''CharacterKeypad'') != null){
				document.getElementById(''CharacterKeypad'').style.display = ''block'';
			}
		}
//This added for 6.0.4.11: hide accented character buttons if no textbox
		else{
			if (document.getElementById(''CharacterKeypad'') != null){
				document.getElementById(''CharacterKeypad'').style.display = ''none'';
			}
		}
	}
}

function ChangeQ(ChangeBy){
//The following line prevents moving to another question until the current
//question is answered correctly. Uncomment it to enable this behaviour. 
//	if (State[CurrQNum][0] == -1){return;}
	if (((CurrQNum + ChangeBy) < 0)||((CurrQNum + ChangeBy) >= QArray.length)){return;}
	QArray[CurrQNum].style.display = ''none'';
	CurrQNum += ChangeBy;
	QArray[CurrQNum].style.display = '''';
//Undocumented function added 10/12/2004
	ShowSpecialReadingForQuestion();
	SetQNumReadout();
	SetFocusToTextbox();
}

var HiddenReadingShown = false;
function ShowSpecialReadingForQuestion(){
//Undocumented function for showing specific reading text elements which change with each question
//Added on 10/12/2004
	if (document.getElementById(''ReadingDiv'') != null){
		if (HiddenReadingShown == true){
			document.getElementById(''ReadingDiv'').innerHTML = '''';
		}
		if (QArray[CurrQNum] != null){
//Fix for 6.0.4.25
			var Children = QArray[CurrQNum].getElementsByTagName(''div'');
			for (var i=0; i<Children.length; i++){
			if (Children[i].className=="HiddenReading"){
					document.getElementById(''ReadingDiv'').innerHTML = Children[i].innerHTML;
					HiddenReadingShown = true;
//Hide the ShowAllQuestions button to avoid confusion
					if (document.getElementById(''ShowMethodButton'') != null){
						document.getElementById(''ShowMethodButton'').style.display = ''none'';
					}
				}
			}	
		}
	}
}

function SetQNumReadout(){
	document.getElementById(''QNumReadout'').innerHTML = (CurrQNum+1) + '' / '' + QArray.length;
	if ((CurrQNum+1) >= QArray.length){
		if (document.getElementById(''NextQButton'') != null){
			document.getElementById(''NextQButton'').style.visibility = ''hidden'';
		}
	}
	else{
		if (document.getElementById(''NextQButton'') != null){
			document.getElementById(''NextQButton'').style.visibility = ''visible'';
		}
	}
	if (CurrQNum <= 0){
		if (document.getElementById(''PrevQButton'') != null){
			document.getElementById(''PrevQButton'').style.visibility = ''hidden'';
		}
	}
	else{
		if (document.getElementById(''PrevQButton'') != null){
			document.getElementById(''PrevQButton'').style.visibility = ''visible'';
		}
	}
}

var I=new Array();
I[0]=new Array();I[0][0]=100;
I[0][1]='''';
I[0][2]=''0'';
I[0][3]=new Array();
I[0][3][0]=new Array(''Asiaten och Svininfluensan'',''Asiaten \u00E4r en av dem, men den s\u00E5 kallade "svininfluensan" kom inte f\u00F6rr\u00E4n 2000-talet.'',0,0,1);
I[0][3][1]=new Array(''Hongkonginfluensan och F\u00E5gelinfluensan'',''Hongkonginfluensan \u00E4r en av dem, men den s\u00E5 kallade "f\u00E5gelinfluensan" har \u00E4nnu inte orsakat en pandemi trots att m\u00E4nniskor ibland smittas.'',0,0,1);
I[0][3][2]=new Array(''Asiaten och Hongkonginfluensan'',''Ja! Asiaten kom 1955 och Hongkonginfluensan kom 1968-69.'',1,100,1);
I[0][3][3]=new Array(''Svininfluensan och F\u00E5gelinfluensan'',''Den s\u00E5 kallade "svininfluensan" kom inte f\u00F6rr\u00E4n 2000-talet och "f\u00E5gelinfluensan" har \u00E4nnu inte orsakat en pandemi.'',0,0,1);
I[1]=new Array();I[1][0]=100;
I[1][1]='''';
I[1][2]=''0'';
I[1][3]=new Array();
I[1][3][0]=new Array(''Ett utbrott av en sjukdom i en viss region'',''N\u00E4r ett utbrott h\u00E5ller sig till en viss region (till exempel endast Sverige eller Skandinavien) kallas det f\u00F6r en epidemi.'',0,0,1);
I[1][3][1]=new Array(''Ett v\u00E4rldsomsp\u00E4nnande utbrott av en sjukdom'',''Ja! En pandemi \u00E4r n\u00E4r samma sjukdom infekterar m\u00E4nniskor runtom p\u00E5 jorden samtidigt. Under 2009 drabbades Sverige och m\u00E5nga andra l\u00E4nder av en pandemi av influensa AH1N1)2009.'',1,100,1);
I[1][3][2]=new Array(''Ett utbrott av ett virus som varar i minst tre m\u00E5nader'',''Det \u00E4r inte l\u00E4ngden p\u00E5 utbrottet som g\u00F6r det till en pandemi - men en pandemi varar ofta \u00E4nnu l\u00E4ngre \u00E4n tre m\u00E5nader.'',0,0,1);
I[1][3][3]=new Array(''Ett utbrott d\u00E4r mer \u00E4n h\u00E4lften av de smittade m\u00E4nniskorna d\u00F6r'',''Det \u00E4r inte hur stor andel som d\u00F6r som g\u00F6r det till en pandemi. Vissa pandemier kr\u00E4ver m\u00E5nga d\u00F6dsoffer, medan andra \u00E4r relativt milda.'',0,0,1);
I[2]=new Array();I[2][0]=100;
I[2][1]='''';
I[2][2]=''0'';
I[2][3]=new Array();
I[2][3][0]=new Array(''Ett insektsbett'',''Insektsbett kan ge andra smittor, men inte influensa.'',0,0,1);
I[2][3][1]=new Array(''Ett virus'',''Ja! Influensa \u00E4r en virussjukdom. Det finns tre typer av influensavirus; influensa A, B och C, som alla tillh\u00F6r gruppen ortomyxovirus.'',1,100,1);
I[2][3][2]=new Array(''M\u00F6gel'',''M\u00F6gel kan man f\u00E5 besv\u00E4r av, men inte influensa.'',0,0,1);
I[2][3][3]=new Array(''Att \u00E4ta d\u00E5lig mat'',''Ibland kallas magsjuka som man f\u00E5r av till exempel d\u00E5lig mat f\u00F6r maginfluensa, men den orsakas inte av influensa.'',0,0,1);
I[3]=new Array();I[3][0]=100;
I[3][1]='''';
I[3][2]=''0'';
I[3][3]=new Array();
I[3][3][0]=new Array(''Ordet betyder "farliga partiklar"'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[3][3][1]=new Array(''Ordet betyder "gift"'',''Ja! Ordet \u00E4r latin och betyder gift.'',1,100,1);
I[3][3][2]=new Array(''Ordet betyder "mycket smittsam"'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[3][3][3]=new Array(''Ordet h\u00E4rstammar fr\u00E5n namnet p\u00E5 den irl\u00E4ndska l\u00E4karen Donald McVirus som uppt\u00E4ckte den sjukdomsalstrande mikroorganismen'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[4]=new Array();I[4][0]=100;
I[4][1]='''';
I[4][2]=''0'';
I[4][3]=new Array();
I[4][3][0]=new Array(''Med hj\u00E4lp av deras storlek'',''Influensapartiklar \u00E4r alla r\u00E4tts\u00E5 lika i storlek (cirka 80-120 nm i diameter).'',0,0,1);
I[4][3][1]=new Array(''Med hj\u00E4lp av allvarlighetsgraden p\u00E5 sjukdomen som viruset kan orsaka'',''Det \u00E4r inte s\u00E5 man skiljer dem \u00E5t.'',0,0,1);
I[4][3][2]=new Array(''Med hj\u00E4lp av proteiner p\u00E5 utsidan av viruset'',''Ja! P\u00E5 utsidan av viruset finns proteinerna hemagglutinin och neuraminidas (H och N). Det finns olika typer av H och N som heter, till exempel H1, H2, osv. Olika influensavirus ben\u00E4mns efter deras H och N typer - som till exempel influensa A(H2N3) eller A(H1N1).'',1,100,1);
I[4][3][3]=new Array(''Med hj\u00E4lp av deras f\u00E4rg'',''Det \u00E4r inte f\u00E4rgen som skiljer dem \u00E5t.'',0,0,1);
I[5]=new Array();I[5][0]=100;
I[5][1]='''';
I[5][2]=''3'';
I[5][3]=new Array();
I[5][3][0]=new Array(''Droppar fr\u00E5n n\u00E4san eller saliv fr\u00E5n en person som \u00E4r smittad'',''Man kan smittas n\u00E4r n\u00E5gon snyter sig, nyser, hostar, och s\u00E5 vidare. Men finns det andra s\u00E4tt?'',1,100,1);
I[5][3][1]=new Array(''Att vidr\u00F6ra en person som \u00E4r smittad'',''Man kan smittas om man tar i en smittad person. Men finns det andra s\u00E4tt?'',1,100,1);
I[5][3][2]=new Array(''Att r\u00F6ra vid f\u00F6rem\u00E5l som har smitto\u00E4mnen p\u00E5 sin yta'',''Det kan finnas viruspartiklar p\u00E5 olika ytor som en smittad person har vidr\u00F6rt. Men finns det andra s\u00E4tt?'',1,100,1);
I[5][3][3]=new Array(''Ingen av dess s\u00E4tt'',''Jod\u00E5, p\u00E5 alla dessa s\u00E4tt kan man smittas.'',0,0,1);
I[6]=new Array();I[6][0]=100;
I[6][1]='''';
I[6][2]=''0'';
I[6][3]=new Array();
I[6][3][0]=new Array(''750'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[6][3][1]=new Array(''7 500'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[6][3][2]=new Array(''75 000'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[6][3][3]=new Array(''750 000'',''Ja! Det kan finnas upp till 750 000 viruspartiklar i en milliliter av n\u00E4ssekret, och en hel del kan ju flyga ut n\u00E4r man nyser!'',1,100,1);
I[7]=new Array();I[7][0]=100;
I[7][1]='''';
I[7][2]=''0'';
I[7][3]=new Array();
I[7][3][0]=new Array(''cirka 1 dag'',''Nja, s\u00E5 snabbt brukar man inte bli frisk.'',0,0,1);
I[7][3][1]=new Array(''cirka 1 vecka'',''Ja! De flesta som f\u00E5r influensa har tillfrisknat efter cirka en vecka.'',1,100,1);
I[7][3][2]=new Array(''l\u00E4ngre \u00E4n 2 veckor'',''Om man \u00E4r sjuk i influensa-liknande sjukdom i mer \u00E4n 2 veckor kan man mist\u00E4nka att det \u00E4r n\u00E5gon annan sjukdom.'',0,0,1);
I[7][3][3]=new Array(''cirka 1 m\u00E5nad'',''Om man \u00E4r sjuk i influensa-liknande sjukdom i flera veckor kan man mist\u00E4nka att det \u00E4r n\u00E5gon annan sjukdom.'',0,0,1);
I[8]=new Array();I[8][0]=100;
I[8][1]='''';
I[8][2]=''0'';
I[8][3]=new Array();
I[8][3][0]=new Array(''Utmattning efter kampen mellan kroppen och viruspartiklarna'',''Visst kan man bli utmattad av influensa, men det \u00E4r inte fr\u00E4mst det som orsakar d\u00F6dsfall.'',0,0,1);
I[8][3][1]=new Array(''Lunginflammation'',''Ja, s\u00E4rkillt hos \u00E4ldre \u00E4r det ganska vanligt att man p\u00E5 grund av influensainfektionen drabbas av lunginflammation orsakad av bakterier som normalt finns inom luftv\u00E4garna. Det \u00E4r framf\u00F6rallt dessa sekund\u00E4ra lunginflammationer tillsammans med hj\u00E4rtsvikt som orsakar den influensaassocierade \u00F6verd\u00F6dligheten hos \u00E4ldre.'',1,100,1);
I[8][3][2]=new Array(''Hj\u00E4rtinfarkt'',''Hj\u00E4rtinfarkt \u00E4r en ledande d\u00F6dorsak i allm\u00E4nhet, men inte i direkt relation till influensa.'',0,0,1);
I[8][3][3]=new Array(''Uttorkning'',''D\u00F6dsfall p\u00E5 grund av uttorkning brukar snarare drabba magsjuka personer \u00E4n de som har influensa.'',0,0,1);
I[9]=new Array();I[9][0]=100;
I[9][1]='''';
I[9][2]=''0'';
I[9][3]=new Array();
I[9][3][0]=new Array(''Sommar'',''Det \u00E4r inte s\u00E5 m\u00E5nga som f\u00E5r influensa under sommaren.'',0,0,1);
I[9][3][1]=new Array(''Vinter'',''Ja! Den st\u00F6rsta influensav\u00E5gen brukar komma i midvintertider.'',1,100,1);
I[9][3][2]=new Array(''V\u00E5r'',''S\u00E4songsepidemin av influensa avtar n\u00E4r det blir v\u00E5r.'',0,0,1);
I[9][3][3]=new Array(''H\u00F6st'',''Det \u00E4r m\u00E5nga som f\u00E5r influensa under h\u00F6sten, men det \u00E4r \u00E4nnu fler under en annan \u00E5rstid.'',0,0,1);
I[10]=new Array();I[10][0]=100;
I[10][1]='''';
I[10][2]=''0'';
I[10][3]=new Array();
I[10][3][0]=new Array(''1933'',''Nej, men 1933 var f\u00F6rsta g\u00E5ngen man isolerade influensaviruset. F\u00F6rs\u00F6k igen!'',0,0,1);
I[10][3][1]=new Array(''1942'',''Ja!'',1,100,1);
I[10][3][2]=new Array(''1950'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[10][3][3]=new Array(''1967'',''F\u00F6rs\u00F6k igen!'',0,0,1);
I[11]=new Array();I[11][0]=100;
I[11][1]='''';
I[11][2]=''0'';
I[11][3]=new Array();
I[11][3][0]=new Array(''Viruset odlas i befruktade h\u00F6ns\u00E4gg, avd\u00F6das och renas fram'',''Ja, det \u00E4r s\u00E5 det fungerar. Det tar flera m\u00E5nader att framst\u00E4lla varje s\u00E4songs influensavaccin. Vilka variationer av influensa som ska vara med i vaccinet best\u00E4ms vintern f\u00F6re s\u00E4songen som sedan b\u00F6rjar p\u00E5 h\u00F6sten.'',1,100,1);
I[11][3][1]=new Array(''Viruset odlas i kycklingar som injiceras med influensavirus. Efter fem dagar tas blod fr\u00E5n kycklingen och vaccinet renas fram.'',''Visst involverar det kycklingar, men inte p\u00E5 det h\u00E4r s\u00E4ttet.'',0,0,1);
I[11][3][2]=new Array(''Viruset renas fram ur blodet fr\u00E5n m\u00E4nniskor som har influensa'',''Blodprov p\u00E5 m\u00E4nniskor som \u00E4r smittade med influensa anv\u00E4nds f\u00E4mst f\u00F6r att diagnosera vilken typ av influensa de har.'',0,0,1);
I[12]=new Array();I[12][0]=100;
I[12][1]='''';
I[12][2]=''0'';
I[12][3]=new Array();
I[12][3][0]=new Array(''En sorts antibiotika'',''Nej, men det \u00E4r ocks\u00E5 en medicin mot sjukdom. Antibiotika fungerar bara mot bakterier, inte virus som influensa.'',0,0,1);
I[12][3][1]=new Array(''Ett nytt vaccin mot influensa'',''Nej, men det \u00E4r n\u00E5got som har med influensa att g\u00F6ra.'',0,0,1);
I[12][3][2]=new Array(''En medicin som bromsar f\u00F6r\u00F6kning av ett virus'',''Ja, Tamiflu \u00E4r ett s\u00E5 kallat antiviralt l\u00E4kemedel.'',1,100,1);
I[12][3][3]=new Array(''En ny sorts tandkr\u00E4m f\u00F6r vita t\u00E4nder'',''Nej, f\u00F6rs\u00F6k igen!'',0,0,1);
I[13]=new Array();I[13][0]=100;
I[13][1]='''';
I[13][2]=''0'';
I[13][3]=new Array();
I[13][3][0]=new Array(''P\u00E5st\u00E5ende 2'',''Det \u00E4r sant, men det \u00E4r ocks\u00E5 sant att man kan smitta andra n\u00E4r man skrattar!'',0,0,1);
I[13][3][1]=new Array(''P\u00E5st\u00E5ende 1'',''Det \u00E4r sant, men det \u00E4r ocks\u00E5 sant att mer smittsamma virus sprider sig snabbare!'',0,0,1);
I[13][3][2]=new Array(''Inget av p\u00E5st\u00E5endena'',''Jo, b\u00E5da \u00E4r korrekta.'',0,0,1);
I[13][3][3]=new Array(''B\u00E5da p\u00E5st\u00E5endena'',''Ja! B\u00E5da p\u00E5st\u00E5endena \u00E4r korrekta!'',1,100,1);


function StartUp(){
	RemoveBottomNavBarForIE();

//If there''s only one question, no need for question navigation controls
	if (QsToShow < 2){
		document.getElementById(''QNav'').style.display = ''none'';
	}
	
//Stash the instructions so they can be redisplayed
	strInstructions = document.getElementById(''InstructionsDiv'').innerHTML;
	

	

	

	
	CompleteEmptyFeedback();

	SetUpQuestions();
	ClearTextBoxes();
	CreateStatusArray();
	

	
//Check search string for q parameter
	if (document.location.search.length > 0){
		if (ShuffleQs == false){
			var JumpTo = parseInt(document.location.search.substring(1,document.location.search.length))-1;
			if (JumpTo <= QsToShow){
				ChangeQ(JumpTo);
			}
		}
	}
//Undocumented function added 10/12/2004
	ShowSpecialReadingForQuestion();
}

function ShowHideQuestions(){
	FuncBtnOut(document.getElementById(''ShowMethodButton''));
	document.getElementById(''ShowMethodButton'').style.display = ''none'';
	if (ShowingAllQuestions == false){
		for (var i=0; i<QArray.length; i++){
				QArray[i].style.display = '''';
			}
		document.getElementById(''Questions'').style.listStyleType = ''decimal'';
		document.getElementById(''OneByOneReadout'').style.display = ''none'';
		document.getElementById(''ShowMethodButton'').innerHTML = ShowOneByOneCaption;
		ShowingAllQuestions = true;
	}
	else{
		for (var i=0; i<QArray.length; i++){
				if (i != CurrQNum){
					QArray[i].style.display = ''none'';
				}
			}
		document.getElementById(''Questions'').style.listStyleType = ''none'';
		document.getElementById(''OneByOneReadout'').style.display = '''';
		document.getElementById(''ShowMethodButton'').innerHTML = ShowAllQuestionsCaption;
		ShowingAllQuestions = false;	
	}
	document.getElementById(''ShowMethodButton'').style.display = ''inline'';
}

function CreateStatusArray(){
	var QNum, ANum;
//For each item in the item array
	for (QNum=0; QNum<I.length; QNum++){
//Check if the question still exists (hasn''t been nuked by showing a random selection)
		if (document.getElementById(''Q_'' + QNum) != null){
			State[QNum] = new Array();
			State[QNum][0] = -1; //Score for this q; -1 shows question not done yet
			State[QNum][1] = new Array(); //answers
			for (ANum = 0; ANum<I[QNum][3].length; ANum++){
				State[QNum][1][ANum] = 0; //answer not chosen yet; when chosen, will store its position in the series of choices
			}
			State[QNum][2] = 0; //tries at this q so far
			State[QNum][3] = 0; //incrementing percent-correct values of selected answers
			State[QNum][4] = 0; //penalties incurred for hints
			State[QNum][5] = ''''; //Sequence of answers chosen by number
		}
		else{
			State[QNum] = null;
		}
	}
}



function CheckMCAnswer(QNum, ANum, Btn){
//if question doesn''t exist, bail
	if (State[QNum].length < 1){return;}
	
//Get the feedback
	Feedback = I[QNum][3][ANum][1];
	
//Now show feedback and bail if question already complete
	if (State[QNum][0] > -1){
//Add an extra message explaining that the question
// is finished if defined by the user
		if (strQuestionFinished.length > 0){Feedback += ''<br />'' + strQuestionFinished;}
//Show the feedback
		ShowMessage(Feedback);
//New for 6.2.2.1: If you want to mark an answer as correct even when it''s the final choice, uncomment this line.
//		if (I[QNum][3][ANum][2] >= 1){Btn.innerHTML = CorrectIndicator;}else{Btn.innerHTML = IncorrectIndicator;}	
		return;
	}
	
//Hide the button while processing
	Btn.style.display = ''none'';

//Increment the number of tries
	State[QNum][2]++;
	
//Add the percent-correct value of this answer
	State[QNum][3] += I[QNum][3][ANum][3];
	
//Store the try number in the answer part of the State array, for tracking purposes
	State[QNum][1][ANum] = State[QNum][2];
	if (State[QNum][5].length > 0){State[QNum][5] += '' | '';}
	State[QNum][5] += String.fromCharCode(65+ANum);
	
//Should this answer be accepted as correct?
	if (I[QNum][3][ANum][2] < 1){
//It''s wrong

//Mark the answer
		Btn.innerHTML = IncorrectIndicator;
		
//Remove any previous score unless exercise is finished (6.0.3.8+)
		if (Finished == false){
			WriteToInstructions(strInstructions);
		}	
		
//Check whether this leaves just one MC answer unselected, in which case the Q is terminated
		var RemainingAnswer = FinalAnswer(QNum);
		if (RemainingAnswer > -1){
//Behave as if the last answer had been selected, but give no credit for it
//Increment the number of tries
			State[QNum][2]++;		
		
//Calculate the score for this question
			CalculateMCQuestionScore(QNum);
			
//Get the overall score and add it to the feedback
			CalculateOverallScore();
//New for 6.2.2.1
			var QsDone = CheckQuestionsCompleted();
			if ((ContinuousScoring == true)||(Finished == true)){
				Feedback += ''<br />'' + YourScoreIs + '' '' + Score + ''%.'' + ''<br />'' + QsDone;
				WriteToInstructions(YourScoreIs + '' '' + Score + ''%.'' + ''<br />'' + QsDone);
			}
			else{
				WriteToInstructions(QsDone);
			}
		}
	}
	else{
//It''s right
//Mark the answer
		Btn.innerHTML = CorrectIndicator;
				
//Calculate the score for this question
		CalculateMCQuestionScore(QNum);
		
//New for 6.2.2.0
		var QsDone = CheckQuestionsCompleted();

//Get the overall score and add it to the feedback
		if (ContinuousScoring == true){
			CalculateOverallScore();
			if ((ContinuousScoring == true)||(Finished == true)){
				Feedback += ''<br />'' + YourScoreIs + '' '' + Score + ''%.'' + ''<br />'' + QsDone;
				WriteToInstructions(YourScoreIs + '' '' + Score + ''%.'' + ''<br />'' + QsDone);
			}
		}
		else{
			WriteToInstructions(QsDone);
		}
	}
	
//Show the button again
	Btn.style.display = ''inline'';
	
//Finally, show the feedback	
	ShowMessage(Feedback);
	
//Check whether all questions are now done
	CheckFinished();
}

function CalculateMCQuestionScore(QNum){
	var Tries = State[QNum][2] + State[QNum][4]; //include tries and hint penalties
	var PercentCorrect = State[QNum][3];
	var TotAns = GetTotalMCAnswers(QNum);
	var HintPenalties = State[QNum][4];
	
//Make sure it''s not already complete

	if (State[QNum][0] < 0){
//Allow for Hybrids
		if (HintPenalties >= 1){
			State[QNum][0] = 0;
		}
		else{
//This line calculates the score for this question
			if (TotAns == 1){
				State[QNum][0] = 1;
			}
			else{
				State[QNum][0] = ((TotAns-((Tries*100)/State[QNum][3]))/(TotAns-1));
			}
		}
//Fix for Safari bug added for version 6.0.3.42 (negative infinity problem)
		if ((State[QNum][0] < 0)||(State[QNum][0] == Number.NEGATIVE_INFINITY)){
			State[QNum][0] = 0;
		}
	}
}

function GetTotalMCAnswers(QNum){
	var Result = 0;
	for (var ANum=0; ANum<I[QNum][3].length; ANum++){
		if (I[QNum][3][ANum][4] == 1){ //This is an MC answer
			Result++;
		}
	}
	return Result;
}

function FinalAnswer(QNum){
	var UnchosenAnswers = 0;
	var FinalAnswer = -1;
	for (var ANum=0; ANum<I[QNum][3].length; ANum++){
		if (I[QNum][3][ANum][4] == 1){ //This is an MC answer
			if (State[QNum][1][ANum] < 1){ //This answer hasn''t been chosen yet
				UnchosenAnswers++;
				FinalAnswer = ANum;
			}
		}
	}
	if (UnchosenAnswers == 1){
		return FinalAnswer;
	}
	else{
		return -1;
	}
}





function CheckMultiSelAnswer(QNum){
//bail if question doesn''t exist or exercise finished
	if ((State[QNum].length < 1)||(Finished == true)){return;}

//Increment the tries for this question
	State[QNum][2]++;
	
	var ShouldBeChecked;
	var Matches = 0;
	if (State[QNum][5].length > 0){State[QNum][5] += '' | '';}
	
//Check if there are any mismatches
	Feedback = '''';
	var CheckBox = null;
	for (var ANum=0; ANum<I[QNum][3].length; ANum++){
		CheckBox = document.getElementById(''Q_'' + QNum + ''_'' + ANum + ''_Chk'');
		if (CheckBox.checked == true){
			State[QNum][5] += ''Y'';
		}
		else{
			State[QNum][5] += ''N'';
		}
		ShouldBeChecked = (I[QNum][3][ANum][2] == 1);
		if (ShouldBeChecked == CheckBox.checked){
			Matches++;
		}
		else{
			Feedback = I[QNum][3][ANum][1];
		}
	}
//Add the hit readout
	Feedback = Matches + '' / '' + I[QNum][3].length + ''<br />'' + Feedback;
	if (Matches == I[QNum][3].length){
//It''s right
		CalculateMultiSelQuestionScore(QNum);
		
//New for 6.2.2.0
		var QsDone = CheckQuestionsCompleted();
		
		if (ContinuousScoring == true){
			CalculateOverallScore();
			if ((ContinuousScoring == true)||(Finished == true)){
				Feedback += ''<br />'' + YourScoreIs + '' '' + Score + ''%.'' + ''<br />'' + QsDone;
				WriteToInstructions(YourScoreIs + '' '' + Score + ''%.'' + ''<br />'' + QsDone);
			}
			else{
				WriteToInstructions(QsDone);
			}
		}
	}
	else{
//It''s wrong -- Remove any previous score unless exercise is finished (6.0.3.8+)
		if (Finished == false){
			WriteToInstructions(strInstructions);
		}	
	}
		
//Show the feedback
	ShowMessage(Feedback);
	
//Check whether all questions are now done
	CheckFinished();
}

function CalculateMultiSelQuestionScore(QNum){
	var Tries = State[QNum][2];
	var TotAns = State[QNum][1].length;
	
//Make sure it''s not already complete
	if (State[QNum][0] < 0){
		State[QNum][0] = (TotAns - (Tries-1)) / TotAns;
		if (State[QNum][0] < 0){
			State[QNum][0] = 0;
		}
	}
}



function CalculateOverallScore(){
	var TotalWeighting = 0;
	var TotalScore = 0;
	
	for (var QNum=0; QNum<State.length; QNum++){
		if (State[QNum] != null){
			if (State[QNum][0] > -1){
				TotalWeighting += I[QNum][0];
				TotalScore += (I[QNum][0] * State[QNum][0]);
			}
		}
	}
	if (TotalWeighting > 0){
		Score = Math.floor((TotalScore/TotalWeighting)*100);
	}
	else{
//if TotalWeighting is 0, no questions so far have any value, so 
//no penalty should be shown.
		Score = 100; 
	}
}

//New for 6.2.2.0
function CheckQuestionsCompleted(){
	if (ShowCompletedSoFar == false){return '''';}
	var QsCompleted = 0;
	for (var QNum=0; QNum<State.length; QNum++){
		if (State[QNum] != null){
			if (State[QNum][0] >= 0){
				QsCompleted++;
			}
		}
	}
//Fixes for 6.2.2.2
	if (QsCompleted >= QArray.length){
		return ExerciseCompleted;
	}
	else{
		return CompletedSoFar + '' '' + QsCompleted + ''/'' + QArray.length + ''.'';
	}
}

function CheckFinished(){
	var FB = '''';
	var AllDone = true;
	for (var QNum=0; QNum<State.length; QNum++){
		if (State[QNum] != null){
			if (State[QNum][0] < 0){
				AllDone = false;
			}
		}
	}
	if (AllDone == true){
	
//Report final score and submit if necessary
		CalculateOverallScore();
		FB = YourScoreIs + '' '' + Score + ''%.'';
		if (ShowCorrectFirstTime == true){
			var CFT = 0;
			for (QNum=0; QNum<State.length; QNum++){
				if (State[QNum] != null){
					if (State[QNum][0] >= 1){
						CFT++;
					}
				}
			}
			FB += ''<br />'' + CorrectFirstTime + '' '' + CFT + ''/'' + QsToShow;
		}
		
//New for 6.2.2.0
		FB += ''<br />'' + ExerciseCompleted;
		
		WriteToInstructions(FB);
		
		Finished == true;




		TimeOver = true;
		Locked = true;
		


		Finished = true;
		Detail = ''<?xml version="1.0"?><hpnetresult><fields>'';
		for (QNum=0; QNum<State.length; QNum++){
			if (State[QNum] != null){
				if (State[QNum][5].length > 0){
					Detail += ''<field><fieldname>Question #'' + (QNum+1) + ''</fieldname><fieldtype>question-tracking</fieldtype><fieldlabel>Q '' + (QNum+1) + ''</fieldlabel><fieldlabelid>QuestionTrackingField</fieldlabelid><fielddata>'' + State[QNum][5] + ''</fielddata></field>'';
				}
			}
		}
		Detail += ''</fields></hpnetresult>'';
		setTimeout(''Finish()'', SubmissionTimeout);
	}

}










//-->

//]]>

</script>


</head>

<body onload="StartUp()" id="TheBody" >

<!-- BeginTopNavButtons -->


<div class="NavButtonBar" id="TopNavBar">




<button class="NavButton" onfocus="NavBtnOver(this)" onblur="NavBtnOut(this)"  onmouseover="NavBtnOver(this)" onmouseout="NavBtnOut(this)" onmousedown="NavBtnDown(this)" onmouseup="NavBtnOut(this)" onclick="location=''contents.htm''; return false;"> Tillbaka till Influensakoll.se </button>



<button class="NavButton" onfocus="NavBtnOver(this)" onblur="NavBtnOut(this)" onmouseover="NavBtnOver(this)" onmouseout="NavBtnOut(this)" onmousedown="NavBtnDown(this)" onmouseup="NavBtnOut(this)" onclick="location=''nextpage.htm''; return false;">=&gt;</button>


</div>



<!-- EndTopNavButtons -->

<div class="Titles">
	<h2 class="ExerciseTitle">Fr&#x00E5;gesport om influensa!</h2>

	<h3 class="ExerciseSubtitle">Hur mycket kan du om influensa?</h3>



</div>

<div id="InstructionsDiv" class="StdDiv">
	<div id="Instructions">Klicka p&#x00E5; r&#x00E4;tt svar! Du f&#x00E5;r veta direkt om du hade r&#x00E4;tt. Om du vill l&#x00E4;sa mer kan du klicka p&#x00E5; de andra svaren. </div>
</div>




<div id="MainDiv" class="StdDiv">
 
<div id="QNav" class="QuestionNavigation">

<p style="text-align: right;">
<button id="ShowMethodButton" class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)" onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOver(this)" onclick="ShowHideQuestions(); return false;">Visa alla fr&#x00E5;gor och dina svar</button>
</p>

<div id="OneByOneReadout">
<button id="PrevQButton" class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)" onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOver(this)" onclick="ChangeQ(-1); return false;">&lt;bak&#x00E5;t</button>

<span id="QNumReadout" class="QNum">&nbsp;</span>

<button id="NextQButton" class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)" onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOver(this)" onclick="ChangeQ(1); return false;">n&#x00E4;sta fr&#x00E5;ga&gt;</button>
<br />
</div>

</div>
 
<ol class="QuizQuestions" id="Questions">
<li class="QuizQuestion" id="Q_0" style="display: none;"><div class="QuestionText">Spanska sjukan var en av de tre stora pandemierna under 1900-talet. Vad kallades de andra tv&#x00E5;?</div><ol class="MCAnswers"><li id="Q_0_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_0_0_Btn" onclick="CheckMCAnswer(0,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Asiaten och Svininfluensan</li><li id="Q_0_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_0_1_Btn" onclick="CheckMCAnswer(0,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Hongkonginfluensan och F&#x00E5;gelinfluensan</li><li id="Q_0_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_0_2_Btn" onclick="CheckMCAnswer(0,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Asiaten och Hongkonginfluensan</li><li id="Q_0_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_0_3_Btn" onclick="CheckMCAnswer(0,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Svininfluensan och F&#x00E5;gelinfluensan</li></ol></li>
<li class="QuizQuestion" id="Q_1" style="display: none;"><div class="QuestionText">Vad &#x00E4;r en pandemi?</div><ol class="MCAnswers"><li id="Q_1_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_1_0_Btn" onclick="CheckMCAnswer(1,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett utbrott av en sjukdom i en viss region</li><li id="Q_1_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_1_1_Btn" onclick="CheckMCAnswer(1,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett v&#x00E4;rldsomsp&#x00E4;nnande utbrott av en sjukdom</li><li id="Q_1_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_1_2_Btn" onclick="CheckMCAnswer(1,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett utbrott av ett virus som varar i minst tre m&#x00E5;nader</li><li id="Q_1_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_1_3_Btn" onclick="CheckMCAnswer(1,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett utbrott d&#x00E4;r mer &#x00E4;n h&#x00E4;lften av de smittade m&#x00E4;nniskorna d&#x00F6;r</li></ol></li>
<li class="QuizQuestion" id="Q_2" style="display: none;"><div class="QuestionText">Influensainfektion orskas av:</div><ol class="MCAnswers"><li id="Q_2_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_2_0_Btn" onclick="CheckMCAnswer(2,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett insektsbett</li><li id="Q_2_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_2_1_Btn" onclick="CheckMCAnswer(2,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett virus</li><li id="Q_2_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_2_2_Btn" onclick="CheckMCAnswer(2,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;M&#x00F6;gel</li><li id="Q_2_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_2_3_Btn" onclick="CheckMCAnswer(2,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Att &#x00E4;ta d&#x00E5;lig mat</li></ol></li>
<li class="QuizQuestion" id="Q_3" style="display: none;"><div class="QuestionText">Vad betyder ordet virus?</div><ol class="MCAnswers"><li id="Q_3_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_3_0_Btn" onclick="CheckMCAnswer(3,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ordet betyder "farliga partiklar"</li><li id="Q_3_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_3_1_Btn" onclick="CheckMCAnswer(3,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ordet betyder "gift"</li><li id="Q_3_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_3_2_Btn" onclick="CheckMCAnswer(3,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ordet betyder "mycket smittsam"</li><li id="Q_3_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_3_3_Btn" onclick="CheckMCAnswer(3,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ordet h&#x00E4;rstammar fr&#x00E5;n namnet p&#x00E5; den irl&#x00E4;ndska l&#x00E4;karen Donald McVirus som uppt&#x00E4;ckte den sjukdomsalstrande mikroorganismen</li></ol></li>
<li class="QuizQuestion" id="Q_4" style="display: none;"><div class="QuestionText">Hur skiljer man olika influensavirus &#x00E5;t?</div><ol class="MCAnswers"><li id="Q_4_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_4_0_Btn" onclick="CheckMCAnswer(4,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Med hj&#x00E4;lp av deras storlek</li><li id="Q_4_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_4_1_Btn" onclick="CheckMCAnswer(4,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Med hj&#x00E4;lp av allvarlighetsgraden p&#x00E5; sjukdomen som viruset kan orsaka</li><li id="Q_4_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_4_2_Btn" onclick="CheckMCAnswer(4,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Med hj&#x00E4;lp av proteiner p&#x00E5; utsidan av viruset</li><li id="Q_4_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_4_3_Btn" onclick="CheckMCAnswer(4,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Med hj&#x00E4;lp av deras f&#x00E4;rg</li></ol></li>
<li class="QuizQuestion" id="Q_5" style="display: none;"><div class="QuestionText">Du kan smittas av influensa genom:</div><ol class="MSelAnswers"><li id="Q_5_0"><form method="post" action="" onsubmit="return false;"><div><input type="checkbox" id="Q_5_0_Chk" class="MSelCheckbox" />Droppar fr&#x00E5;n n&#x00E4;san eller saliv fr&#x00E5;n en person som &#x00E4;r smittad</div></form></li><li id="Q_5_1"><form method="post" action="" onsubmit="return false;"><div><input type="checkbox" id="Q_5_1_Chk" class="MSelCheckbox" />Att vidr&#x00F6;ra en person som &#x00E4;r smittad</div></form></li><li id="Q_5_2"><form method="post" action="" onsubmit="return false;"><div><input type="checkbox" id="Q_5_2_Chk" class="MSelCheckbox" />Att r&#x00F6;ra vid f&#x00F6;rem&#x00E5;l som har smitto&#x00E4;mnen p&#x00E5; sin yta</div></form></li><li id="Q_5_3"><form method="post" action="" onsubmit="return false;"><div><input type="checkbox" id="Q_5_3_Chk" class="MSelCheckbox" />Ingen av dess s&#x00E4;tt</div></form></li></ol><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" onclick="CheckMultiSelAnswer(5)">Kolla ditt svar!</button></li>
<li class="QuizQuestion" id="Q_6" style="display: none;"><div class="QuestionText">En nysning kan ses som ett stort virusmoln. Vilket nummer kommer i n&#x00E4;rheten av den m&#x00E4;ngd av viruspartiklar som en nysning kan inneh&#x00E5;lla?</div><ol class="MCAnswers"><li id="Q_6_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_6_0_Btn" onclick="CheckMCAnswer(6,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;750</li><li id="Q_6_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_6_1_Btn" onclick="CheckMCAnswer(6,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;7 500</li><li id="Q_6_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_6_2_Btn" onclick="CheckMCAnswer(6,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;75 000</li><li id="Q_6_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_6_3_Btn" onclick="CheckMCAnswer(6,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;750 000</li></ol></li>
<li class="QuizQuestion" id="Q_7" style="display: none;"><div class="QuestionText">Hos annars friska personer varar influensa vanligtvis:</div><ol class="MCAnswers"><li id="Q_7_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_7_0_Btn" onclick="CheckMCAnswer(7,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;cirka 1 dag</li><li id="Q_7_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_7_1_Btn" onclick="CheckMCAnswer(7,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;cirka 1 vecka</li><li id="Q_7_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_7_2_Btn" onclick="CheckMCAnswer(7,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;l&#x00E4;ngre &#x00E4;n 2 veckor</li><li id="Q_7_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_7_3_Btn" onclick="CheckMCAnswer(7,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;cirka 1 m&#x00E5;nad</li></ol></li>
<li class="QuizQuestion" id="Q_8" style="display: none;"><div class="QuestionText">N&#x00E4;r m&#x00E4;nniskor d&#x00F6;r av influensa, vad &#x00E4;r den vanligaste slutliga d&#x00F6;dsorsaken?</div><ol class="MCAnswers"><li id="Q_8_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_8_0_Btn" onclick="CheckMCAnswer(8,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Utmattning efter kampen mellan kroppen och viruspartiklarna</li><li id="Q_8_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_8_1_Btn" onclick="CheckMCAnswer(8,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Lunginflammation</li><li id="Q_8_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_8_2_Btn" onclick="CheckMCAnswer(8,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Hj&#x00E4;rtinfarkt</li><li id="Q_8_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_8_3_Btn" onclick="CheckMCAnswer(8,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Uttorkning</li></ol></li>
<li class="QuizQuestion" id="Q_9" style="display: none;"><div class="QuestionText">Under vilken &#x00E5;rstid &#x00E4;r det st&#x00F6;rst risk att smittas av influensa i Sverige?</div><ol class="MCAnswers"><li id="Q_9_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_9_0_Btn" onclick="CheckMCAnswer(9,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Sommar</li><li id="Q_9_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_9_1_Btn" onclick="CheckMCAnswer(9,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Vinter</li><li id="Q_9_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_9_2_Btn" onclick="CheckMCAnswer(9,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;V&#x00E5;r</li><li id="Q_9_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_9_3_Btn" onclick="CheckMCAnswer(9,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;H&#x00F6;st</li></ol></li>
<li class="QuizQuestion" id="Q_10" style="display: none;"><div class="QuestionText">Vilket &#x00E5;r utvecklades det f&#x00F6;rsta influensavaccinet?</div><ol class="MCAnswers"><li id="Q_10_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_10_0_Btn" onclick="CheckMCAnswer(10,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;1933</li><li id="Q_10_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_10_1_Btn" onclick="CheckMCAnswer(10,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;1942</li><li id="Q_10_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_10_2_Btn" onclick="CheckMCAnswer(10,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;1950</li><li id="Q_10_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_10_3_Btn" onclick="CheckMCAnswer(10,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;1967</li></ol></li>
<li class="QuizQuestion" id="Q_11" style="display: none;"><div class="QuestionText">Hur g&#x00F6;r man influensavaccin?</div><ol class="MCAnswers"><li id="Q_11_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_11_0_Btn" onclick="CheckMCAnswer(11,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Viruset odlas i befruktade h&#x00F6;ns&#x00E4;gg, avd&#x00F6;das och renas fram</li><li id="Q_11_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_11_1_Btn" onclick="CheckMCAnswer(11,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Viruset odlas i kycklingar som injiceras med influensavirus. Efter fem dagar tas blod fr&#x00E5;n kycklingen och vaccinet renas fram.</li><li id="Q_11_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_11_2_Btn" onclick="CheckMCAnswer(11,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Viruset renas fram ur blodet fr&#x00E5;n m&#x00E4;nniskor som har influensa</li></ol></li>
<li class="QuizQuestion" id="Q_12" style="display: none;"><div class="QuestionText">Vad &#x00E4;r Tamiflu?</div><ol class="MCAnswers"><li id="Q_12_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_12_0_Btn" onclick="CheckMCAnswer(12,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;En sorts antibiotika</li><li id="Q_12_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_12_1_Btn" onclick="CheckMCAnswer(12,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Ett nytt vaccin mot influensa</li><li id="Q_12_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_12_2_Btn" onclick="CheckMCAnswer(12,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;En medicin som bromsar f&#x00F6;r&#x00F6;kning av ett virus</li><li id="Q_12_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_12_3_Btn" onclick="CheckMCAnswer(12,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;En ny sorts tandkr&#x00E4;m f&#x00F6;r vita t&#x00E4;nder</li></ol></li>
<li class="QuizQuestion" id="Q_13" style="display: none;"><div class="QuestionText">Vilket av de f&#x00F6;ljande p&#x00E5;st&#x00E5;enden &#x00E4;r r&#x00E4;tt? <br />P&#x00E5;st&#x00E5;ende 1: En smittad person kan sprida ett virus n&#x00E4;r han/hon skrattar. <br />P&#x00E5;st&#x00E5;ende 2: Ju mer smittsamt viruset &#x00E4;r, desto snabbare sprider det sig.</div><ol class="MCAnswers"><li id="Q_13_0"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_13_0_Btn" onclick="CheckMCAnswer(13,0,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;P&#x00E5;st&#x00E5;ende 2</li><li id="Q_13_1"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_13_1_Btn" onclick="CheckMCAnswer(13,1,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;P&#x00E5;st&#x00E5;ende 1</li><li id="Q_13_2"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_13_2_Btn" onclick="CheckMCAnswer(13,2,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;Inget av p&#x00E5;st&#x00E5;endena</li><li id="Q_13_3"><button class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)"  onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" id="Q_13_3_Btn" onclick="CheckMCAnswer(13,3,this)">&nbsp;&nbsp;?&nbsp;&nbsp;</button>&nbsp;&nbsp;B&#x00E5;da p&#x00E5;st&#x00E5;endena</li></ol></li></ol>



</div>



<div class="Feedback" id="FeedbackDiv">
<div class="FeedbackText" id="FeedbackContent"></div>
<button id="FeedbackOKButton" class="FuncButton" onfocus="FuncBtnOver(this)" onblur="FuncBtnOut(this)" onmouseover="FuncBtnOver(this)" onmouseout="FuncBtnOut(this)" onmousedown="FuncBtnDown(this)" onmouseup="FuncBtnOut(this)" onclick="HideFeedback(); return false;">&nbsp;OK&nbsp;</button>
</div>

<!-- BeginBottomNavButtons -->


<div class="NavButtonBar" id="BottomNavBar">




<button class="NavButton" onfocus="NavBtnOver(this)" onblur="NavBtnOut(this)"  onmouseover="NavBtnOver(this)" onmouseout="NavBtnOut(this)" onmousedown="NavBtnDown(this)" onmouseup="NavBtnOut(this)" onclick="location=''contents.htm''; return false;"> Tillbaka till Influensakoll.se </button>



<button class="NavButton" onfocus="NavBtnOver(this)" onblur="NavBtnOut(this)" onmouseover="NavBtnOver(this)" onmouseout="NavBtnOut(this)" onmousedown="NavBtnDown(this)" onmouseup="NavBtnOut(this)" onclick="location=''nextpage.htm''; return false;">=&gt;</button>


</div>



<!-- EndBottomNavButtons -->

<!-- BeginSubmissionForm -->

<!-- EndSubmissionForm -->

</body>

</html>
', '');
INSERT INTO snippet_snippet VALUES (41, 'RadioEpstein', '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="475" height="77" id="srembeddedplayer" align="middle"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3747441%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><object name="flash" data="http://sverigesradio.se/api/flash/player_embed.swf?8" width="475" height="77" type="application/x-shockwave-flash"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3747441%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb&flashSmal=true" /><param name="pluginurl" value="http://get.adobe.com/se/flashplayer/" /><a href="http://sverigesradio.se/topsy/ljudfil/3747441.m4a">Lyssna: Influensakoll</a></object></object>', '');
INSERT INTO snippet_snippet VALUES (26, 'RSS-111031v2', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
<meta http-equiv="pragma" content="no-cache">
        <title>Untitled Page</title>
 

<script src="../+media/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">


var defaultXMLPath = ''/xml/12.738383ed12c0734710e80001200.portlet?state=rss&sv.contenttype=text/xml;charset=UTF-8&searchQuery=svininfluensa%20H1N1%20"influensa"%20f%C3%B6rkylning%20influensavaccin%20f%C3%A5gelinfluensa%20snuva%20vaccination%20pandemi%20f%C3%B6rkylningsvirus%20smittskyddsinstitutet%20feber%20hosta&sort=cat_date&KATEGORI=Nyhet&nbrOfHits=5'';

    </script>
    <script src="../+media/js/jquery_drs.js" type="text/javascript"></script>
       <!--[if IE 6]>
        <link rel="stylesheet" href="css/iefix.css" type="text/css" media="screen, print" />
       <![endif]-->
    </head>
    <body>
    <div id="javascriptWarning">  
        <noscript>
            För att kunna använda RSS måste du först aktivera JavaScript i din webbläsare.
        </noscript>
    </div>     
            <div id="contentlist">

            </div>
    </body>
    </html>

', '');
INSERT INTO snippet_snippet VALUES (2, 'RSSgammalt', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
<meta http-equiv="pragma" content="no-cache">
        <title>Untitled Page</title>
       <script src="/media/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">


var defaultXMLPath = ''/xml/12.738383ed12c0734710e80001200.portlet?state=rss&sv.contenttype=text/xml;charset=UTF-8&searchQuery=svininfluensa%20H1N1%20"influensa"%20f%C3%B6rkylning%20influensavaccin%20f%C3%A5gelinfluensa%20snuva%20vaccination%20pandemi%20f%C3%B6rkylningsvirus%20smittskyddsinstitutet%20feber%20hosta&sort=cat_date&KATEGORI=Nyhet&nbrOfHits=5'';

    </script>
    <script src="/media/js/jquery_drs.js" type="text/javascript"></script>
       <!--[if IE 6]>
        <link rel="stylesheet" href="css/iefix.css" type="text/css" media="screen, print" />
       <![endif]-->
    </head>
    <body>
    <div id="javascriptWarning">  
        <noscript>
            För att kunna använda RSS måste du först aktivera JavaScript i din webbläsare.
        </noscript>
    </div>     
            <div id="contentlist">

            </div>
    </body>
    </html>
', '');
INSERT INTO snippet_snippet VALUES (38, 'RSSnytt', '<script src="/media/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
var defaultXMLPath = ''/xml/12.738383ed12c0734710e80001200.portlet?state=rss&sv.contenttype=text/xml;charset=UTF-8&searchQuery=svininfluensa%20H1N1%20"influensa"%20f%C3%B6rkylning%20influensavaccin%20f%C3%A5gelinfluensa%20snuva%20vaccination%20pandemi%20f%C3%B6rkylningsvirus%20smittskyddsinstitutet%20feber%20hosta&sort=cat_date&KATEGORI=Nyhet&nbrOfHits=5'';

    </script>
    <script src="/media/js/jquery_drs.js" type="text/javascript"></script>
    <div id="javascriptWarning">  
        <noscript>
            För att kunna använda RSS måste du först aktivera JavaScript i din webbläsare.
        </noscript>
    </div>     

', '');
INSERT INTO snippet_snippet VALUES (35, 'SR_Annikaintervju', '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="475" height="124" id="srembeddedplayer" align="middle"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3584616%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb" /><object name="flash" data="http://sverigesradio.se/api/flash/player_embed.swf?8" width="475" height="124" type="application/x-shockwave-flash"><param name="allowFullScreen" value="false" /><param name="movie" value="http://sverigesradio.se/api/flash/player_embed.swf?8" /><param name="quality" value="high" /><param name="flashvars" value="playlist=http%3a%2f%2fsverigesradio.se%2fapi%2fradio%2fradio.aspx%3ftype%3ddb%26id%3d3584616%26codingformat%3d.m4a%26metafile%3dasx%26preview%3ddb" /><param name="pluginurl" value="http://get.adobe.com/se/flashplayer/" /><a href="http://sverigesradio.se/topsy/ljudfil/3584616.m4a">Lyssna: "Annika Linde: Jätteviktigt att veta"</a></object></object>', '');
INSERT INTO snippet_snippet VALUES (44, 'svtorebro', '<object width="416" height="258"><param name="movie" value="http://svt.se/embededflash/2749275/play.swf"></param><param name="wmode" value="transparent"></param><param name="allowfullscreen" value="true"></param><param name="allowScriptAccess" value="sameDomain"></param><embed src="http://svt.se/embededflash/2749275/play.swf" type="application/x-shockwave-flash" wmode="transparent" allowfullscreen="true" allowScriptAccess="sameDomain" width="416" height="258"></embed></object>', '');
INSERT INTO snippet_snippet VALUES (30, 'Twitterbutton', '<a href="https://twitter.com/share" class="twitter-share-button" data-count="none" data-via="Influensakoll">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>', '');
INSERT INTO snippet_snippet VALUES (29, 'Twitterfollow', '<a href="https://twitter.com/Influensakoll" class="twitter-follow-button" data-show-count="false">Follow @Influensakoll</a>
<script src="//platform.twitter.com/widgets.js" type="text/javascript"></script>', '');
INSERT INTO snippet_snippet VALUES (9, 'vanster_hem_nyheter', '<p>
<a href="http://www.bwz.se/smi/b.aspx?l=4966A86C-CBA5-47E8-A141-6CEC767C1D12&r=1&rcrc=8C7F66C3" 
target="_blank"><font color="black"><B>Vinterkräksjukan är här<font></B></a> 
<br>Smittskyddsinstitutet (SMI) håller koll på vinterkräksjuka på flera sätt. Ett sätt är en analys av sökningar där ordet kräk ingår på webbplatsen Vårdguiden.se. Nu tyder sökdata på att vinterkräksjukan är här.<br>
2011-12-13<br>


<a href="http://www.influensakoll.se/sv/nyheter/" 
target="_blank"><font color="black"><B>Kolla in alla nyheter<font></B></a> 
<br>Nu har vi lagt upp en samlingssida för alla nyheter, både om influensa och influensakoll i media.<br>
2011-12-02<br>


<font color="black"><B>Mer än 750 deltagare!</font></B></a> 
<br>Tack till alla som anmält sig. Influensakolls deltagare bor över hela landet. Sprid gärna länken <a href = "www.influensakoll.se">www.influensakoll.se</a> vidare till vänner och bekanta. Ju fler som deltar desto säkrare blir resultaten!<br>
2011-12-02<br>



<a href="http://arkiv.mitti.se:4711/2011/48/sodermalm/MIIS-20111129-A-016-A.pdf" 
target="_blank"><font color="black"><B>Influensakoll med i Mitt-i-tidningarna</font></B></a> 
<br>I flera av veckans Mitt-i-tidningarna i Stockholmområdet finns Influensakoll med!<br>
2011-11-30<br>



<a href="http://www.smittskyddsinstitutet.se/publikationer/veckorapporter/influensarapporter/sasongen-20112012/influensarapport-vecka-46-1411---2011--2011/" 
target="_blank"><font color="black"><B>Influensaaktiviteten fortsatt låg</font></B></a> 
<br>I SMI:s influensarapport för vecka 46 rapporteras att influensaaktiviteten var fortsatt låg, inte bara i hela Europa men också i övriga världen. Första studier om dubbelinfektioner och virusblandningar har publicerats.<br>
2011-11-26<br>








</p>

</body>
</html> 
', '');



--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('snippet_snippet_id_seq', 44, true);



--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 138, true);


--
-- Data for Name: survey_lastresponse; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_lastresponse (id, user_id, participation_id, data) FROM stdin;
\.


--
-- Name: survey_lastresponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_lastresponse_id_seq', 1, false);


--
-- Data for Name: survey_localflusurvey; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_localflusurvey (id, surveyuser_id, date, status, age_user, data, survey_id) FROM stdin;
\.


--
-- Name: survey_localflusurvey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_localflusurvey_id_seq', 1, false);


--
-- Data for Name: survey_localprofile; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_localprofile (id, surveyuser_id, sq_num_season, sq_num_total, sq_date_first, sq_date_last, birth_date, zip_code, region, gender, a_family, a_smoker, a_vaccine_prev_seasonal, a_vaccine_prev_swine, a_vaccine_current) FROM stdin;
\.


--
-- Name: survey_localprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_localprofile_id_seq', 1, false);


--
-- Data for Name: survey_localresponse; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_localresponse (id, date, user_id, survey_id, answers) FROM stdin;
\.


--
-- Name: survey_localresponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_localresponse_id_seq', 1, false);


--
-- Data for Name: survey_participation; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_participation (id, user_id, survey_id, date, epidb_id, previous_participation_id, previous_participation_date) FROM stdin;
\.


--
-- Name: survey_participation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_participation_id_seq', 1, false);


--
-- Data for Name: survey_profile; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_profile (id, user_id, created, updated, valid, data, survey_id) FROM stdin;
\.


--
-- Name: survey_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_profile_id_seq', 1, false);


--
-- Data for Name: survey_profilesendqueue; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_profilesendqueue (id, owner_id, date, user_id, survey_id, answers) FROM stdin;
\.


--
-- Name: survey_profilesendqueue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_profilesendqueue_id_seq', 1, false);


--
-- Data for Name: survey_responsesendqueue; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_responsesendqueue (id, participation_id, date, user_id, survey_id, answers) FROM stdin;
\.


--
-- Name: survey_responsesendqueue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_responsesendqueue_id_seq', 1, false);


--
-- Data for Name: survey_survey; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_survey (id, survey_id, created, updated, title, description, specification) FROM stdin;
\.


--
-- Name: survey_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_survey_id_seq', 1, false);


--
-- Data for Name: survey_surveyidcode; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_surveyidcode (id, surveyuser_global_id, idcode, fodelsedatum) FROM stdin;
\.


--
-- Name: survey_surveyidcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_surveyidcode_id_seq', 1, false);


--
-- Data for Name: survey_surveyuser; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY survey_surveyuser (id, global_id, last_participation_id, last_participation_date, name, deleted, user_id) FROM stdin;
\.


--
-- Name: survey_surveyuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: epiwork
--

SELECT pg_catalog.setval('survey_surveyuser_id_seq', 1, false);


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: epiwork
--

COPY thumbnail_kvstore (key, value) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_6a0df834_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_6a0df834_uniq UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_pagemoderator_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_pagemoderator
    ADD CONSTRAINT cms_pagemoderator_pkey PRIMARY KEY (id);


--
-- Name: cms_pagemoderatorstate_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_pkey PRIMARY KEY (id);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_page_id_175d922b_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_page_id_175d922b_uniq UNIQUE (page_id, language);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_contestplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_contestplugin
    ADD CONSTRAINT cmsplugin_contestplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_latestentryplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_latestentryplugin
    ADD CONSTRAINT cmsplugin_latestentryplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_surveychartplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_surveychartplugin
    ADD CONSTRAINT cmsplugin_surveychartplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: contest_prediction_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY contest_prediction
    ADD CONSTRAINT contest_prediction_pkey PRIMARY KEY (id);


--
-- Name: contest_week_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY contest_week
    ADD CONSTRAINT contest_week_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY django_cache
    ADD CONSTRAINT django_cache_pkey PRIMARY KEY (cache_key);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: file_file_cmsplugin_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT file_file_cmsplugin_ptr_id_key UNIQUE (cmsplugin_ptr_id);


--
-- Name: journal_category_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_category
    ADD CONSTRAINT journal_category_pkey PRIMARY KEY (id);


--
-- Name: journal_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_category
    ADD CONSTRAINT journal_category_slug_key UNIQUE (slug);


--
-- Name: journal_categorytranslation_language_code_52722a54_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_categorytranslation
    ADD CONSTRAINT journal_categorytranslation_language_code_52722a54_uniq UNIQUE (language_code, master_id);


--
-- Name: journal_categorytranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_categorytranslation
    ADD CONSTRAINT journal_categorytranslation_pkey PRIMARY KEY (id);


--
-- Name: journal_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_entry
    ADD CONSTRAINT journal_entry_pkey PRIMARY KEY (id);


--
-- Name: journal_entrytranslation_language_code_354a66cf_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_entrytranslation
    ADD CONSTRAINT journal_entrytranslation_language_code_354a66cf_uniq UNIQUE (language_code, master_id);


--
-- Name: journal_entrytranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_entrytranslation
    ADD CONSTRAINT journal_entrytranslation_pkey PRIMARY KEY (id);


--
-- Name: journal_latestentryplugin_cat_latestentryplugin_id_11ca026_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_latestentryplugin_category
    ADD CONSTRAINT journal_latestentryplugin_cat_latestentryplugin_id_11ca026_uniq UNIQUE (latestentryplugin_id, category_id);


--
-- Name: journal_latestentryplugin_category_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY journal_latestentryplugin_category
    ADD CONSTRAINT journal_latestentryplugin_category_pkey PRIMARY KEY (id);


--
-- Name: link_link_cmsplugin_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT link_link_cmsplugin_ptr_id_key UNIQUE (cmsplugin_ptr_id);


--
-- Name: loginurl_key_key_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY loginurl_key
    ADD CONSTRAINT loginurl_key_key_key UNIQUE (key);


--
-- Name: loginurl_key_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY loginurl_key
    ADD CONSTRAINT loginurl_key_pkey PRIMARY KEY (id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: partnersites_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY partnersites_sitesettings
    ADD CONSTRAINT partnersites_sitesettings_pkey PRIMARY KEY (id);


--
-- Name: partnersites_sitesettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY partnersites_sitesettings
    ADD CONSTRAINT partnersites_sitesettings_site_id_key UNIQUE (site_id);


--
-- Name: picture_picture_cmsplugin_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT picture_picture_cmsplugin_ptr_id_key UNIQUE (cmsplugin_ptr_id);


--
-- Name: pollster_chart_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_chart
    ADD CONSTRAINT pollster_chart_pkey PRIMARY KEY (id);


--
-- Name: pollster_chart_survey_id_4f28a0ab_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_chart
    ADD CONSTRAINT pollster_chart_survey_id_4f28a0ab_uniq UNIQUE (survey_id, shortname);


--
-- Name: pollster_charttype_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_charttype
    ADD CONSTRAINT pollster_charttype_pkey PRIMARY KEY (id);


--
-- Name: pollster_charttype_shortname_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_charttype
    ADD CONSTRAINT pollster_charttype_shortname_key UNIQUE (shortname);


--
-- Name: pollster_option_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_option
    ADD CONSTRAINT pollster_option_pkey PRIMARY KEY (id);


--
-- Name: pollster_question_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_question
    ADD CONSTRAINT pollster_question_pkey PRIMARY KEY (id);


--
-- Name: pollster_questioncolumn_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_questioncolumn
    ADD CONSTRAINT pollster_questioncolumn_pkey PRIMARY KEY (id);


--
-- Name: pollster_questiondatatype_js_class_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_questiondatatype
    ADD CONSTRAINT pollster_questiondatatype_js_class_uniq UNIQUE (js_class);


--
-- Name: pollster_questiondatatype_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_questiondatatype
    ADD CONSTRAINT pollster_questiondatatype_pkey PRIMARY KEY (id);


--
-- Name: pollster_questionrow_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_questionrow
    ADD CONSTRAINT pollster_questionrow_pkey PRIMARY KEY (id);


--
-- Name: pollster_rule_object_options_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_rule_object_options
    ADD CONSTRAINT pollster_rule_object_options_pkey PRIMARY KEY (id);


--
-- Name: pollster_rule_object_options_rule_id_7d2e674_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_rule_object_options
    ADD CONSTRAINT pollster_rule_object_options_rule_id_7d2e674_uniq UNIQUE (rule_id, option_id);


--
-- Name: pollster_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_rule
    ADD CONSTRAINT pollster_rule_pkey PRIMARY KEY (id);


--
-- Name: pollster_rule_subject_options_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_rule_subject_options
    ADD CONSTRAINT pollster_rule_subject_options_pkey PRIMARY KEY (id);


--
-- Name: pollster_rule_subject_options_rule_id_7430182e_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_rule_subject_options
    ADD CONSTRAINT pollster_rule_subject_options_rule_id_7430182e_uniq UNIQUE (rule_id, option_id);


--
-- Name: pollster_ruletype_js_class_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_ruletype
    ADD CONSTRAINT pollster_ruletype_js_class_uniq UNIQUE (js_class);


--
-- Name: pollster_ruletype_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_ruletype
    ADD CONSTRAINT pollster_ruletype_pkey PRIMARY KEY (id);


--
-- Name: pollster_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_survey
    ADD CONSTRAINT pollster_survey_pkey PRIMARY KEY (id);


--
-- Name: pollster_translationoption_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationoption
    ADD CONSTRAINT pollster_translationoption_pkey PRIMARY KEY (id);


--
-- Name: pollster_translationoption_translation_id_7d836e5b_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationoption
    ADD CONSTRAINT pollster_translationoption_translation_id_7d836e5b_uniq UNIQUE (translation_id, option_id);


--
-- Name: pollster_translationquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationquestion
    ADD CONSTRAINT pollster_translationquestion_pkey PRIMARY KEY (id);


--
-- Name: pollster_translationquestion_translation_id_7b804ad9_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationquestion
    ADD CONSTRAINT pollster_translationquestion_translation_id_7b804ad9_uniq UNIQUE (translation_id, question_id);


--
-- Name: pollster_translationquestioncolumn_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationquestioncolumn
    ADD CONSTRAINT pollster_translationquestioncolumn_pkey PRIMARY KEY (id);


--
-- Name: pollster_translationquestioncolumn_translation_id_5033066d_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationquestioncolumn
    ADD CONSTRAINT pollster_translationquestioncolumn_translation_id_5033066d_uniq UNIQUE (translation_id, column_id);


--
-- Name: pollster_translationquestionrow_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationquestionrow
    ADD CONSTRAINT pollster_translationquestionrow_pkey PRIMARY KEY (id);


--
-- Name: pollster_translationquestionrow_translation_id_1b7f88bd_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationquestionrow
    ADD CONSTRAINT pollster_translationquestionrow_translation_id_1b7f88bd_uniq UNIQUE (translation_id, row_id);


--
-- Name: pollster_translationsurvey_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationsurvey
    ADD CONSTRAINT pollster_translationsurvey_pkey PRIMARY KEY (id);


--
-- Name: pollster_translationsurvey_survey_id_5430bb1e_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_translationsurvey
    ADD CONSTRAINT pollster_translationsurvey_survey_id_5430bb1e_uniq UNIQUE (survey_id, language);


--
-- Name: pollster_virtualoptiontype_js_class_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_virtualoptiontype
    ADD CONSTRAINT pollster_virtualoptiontype_js_class_uniq UNIQUE (js_class);


--
-- Name: pollster_virtualoptiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY pollster_virtualoptiontype
    ADD CONSTRAINT pollster_virtualoptiontype_pkey PRIMARY KEY (id);

--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: reminder_newsletter_date_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newsletter
    ADD CONSTRAINT reminder_newsletter_date_key UNIQUE (date);


--
-- Name: reminder_newsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newsletter
    ADD CONSTRAINT reminder_newsletter_pkey PRIMARY KEY (id);


--
-- Name: reminder_newslettertemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newslettertemplate
    ADD CONSTRAINT reminder_newslettertemplate_pkey PRIMARY KEY (id);


--
-- Name: reminder_newslettertemplatetranslat_language_code_55b067e5_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newslettertemplatetranslation
    ADD CONSTRAINT reminder_newslettertemplatetranslat_language_code_55b067e5_uniq UNIQUE (language_code, master_id);


--
-- Name: reminder_newslettertemplatetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newslettertemplatetranslation
    ADD CONSTRAINT reminder_newslettertemplatetranslation_pkey PRIMARY KEY (id);


--
-- Name: reminder_newslettertranslation_language_code_b78afa1_uniq; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newslettertranslation
    ADD CONSTRAINT reminder_newslettertranslation_language_code_b78afa1_uniq UNIQUE (language_code, master_id);


--
-- Name: reminder_newslettertranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_newslettertranslation
    ADD CONSTRAINT reminder_newslettertranslation_pkey PRIMARY KEY (id);


--
-- Name: reminder_reminder_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_userreminderinfo
    ADD CONSTRAINT reminder_reminder_pkey PRIMARY KEY (id);


--
-- Name: reminder_reminder_user_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_userreminderinfo
    ADD CONSTRAINT reminder_reminder_user_id_key UNIQUE (user_id);


--
-- Name: reminder_remindererror_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_remindererror
    ADD CONSTRAINT reminder_remindererror_pkey PRIMARY KEY (id);


--
-- Name: reminder_remindersettings_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_remindersettings
    ADD CONSTRAINT reminder_remindersettings_pkey PRIMARY KEY (id);


--
-- Name: reminder_remindersettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY reminder_remindersettings
    ADD CONSTRAINT reminder_remindersettings_site_id_key UNIQUE (site_id);


--
-- Name: snippet_snippet_name_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY snippet_snippet
    ADD CONSTRAINT snippet_snippet_name_key UNIQUE (name);


--
-- Name: snippet_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY snippet_snippet
    ADD CONSTRAINT snippet_snippet_pkey PRIMARY KEY (id);


--
-- Name: snippet_snippetptr_cmsplugin_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT snippet_snippetptr_cmsplugin_ptr_id_key UNIQUE (cmsplugin_ptr_id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: survey_lastresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_lastresponse
    ADD CONSTRAINT survey_lastresponse_pkey PRIMARY KEY (id);


--
-- Name: survey_lastresponse_user_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_lastresponse
    ADD CONSTRAINT survey_lastresponse_user_id_key UNIQUE (user_id);


--
-- Name: survey_localflusurvey_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_localflusurvey
    ADD CONSTRAINT survey_localflusurvey_pkey PRIMARY KEY (id);


--
-- Name: survey_localprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_localprofile
    ADD CONSTRAINT survey_localprofile_pkey PRIMARY KEY (id);


--
-- Name: survey_localprofile_surveyuser_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_localprofile
    ADD CONSTRAINT survey_localprofile_surveyuser_id_key UNIQUE (surveyuser_id);


--
-- Name: survey_localresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_localresponse
    ADD CONSTRAINT survey_localresponse_pkey PRIMARY KEY (id);


--
-- Name: survey_participation_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_participation
    ADD CONSTRAINT survey_participation_pkey PRIMARY KEY (id);


--
-- Name: survey_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_profile
    ADD CONSTRAINT survey_profile_pkey PRIMARY KEY (id);


--
-- Name: survey_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_profile
    ADD CONSTRAINT survey_profile_user_id_key UNIQUE (user_id);


--
-- Name: survey_profilesendqueue_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_profilesendqueue
    ADD CONSTRAINT survey_profilesendqueue_pkey PRIMARY KEY (id);


--
-- Name: survey_responsesendqueue_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_responsesendqueue
    ADD CONSTRAINT survey_responsesendqueue_pkey PRIMARY KEY (id);


--
-- Name: survey_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_survey
    ADD CONSTRAINT survey_survey_pkey PRIMARY KEY (id);


--
-- Name: survey_survey_survey_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_survey
    ADD CONSTRAINT survey_survey_survey_id_key UNIQUE (survey_id);


--
-- Name: survey_surveyidcode_idcode_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_surveyidcode
    ADD CONSTRAINT survey_surveyidcode_idcode_key UNIQUE (idcode);


--
-- Name: survey_surveyidcode_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_surveyidcode
    ADD CONSTRAINT survey_surveyidcode_pkey PRIMARY KEY (id);


--
-- Name: survey_surveyidcode_surveyuser_global_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_surveyidcode
    ADD CONSTRAINT survey_surveyidcode_surveyuser_global_id_key UNIQUE (surveyuser_global_id);


--
-- Name: survey_surveyuser_global_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_surveyuser
    ADD CONSTRAINT survey_surveyuser_global_id_key UNIQUE (global_id);


--
-- Name: survey_surveyuser_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY survey_surveyuser
    ADD CONSTRAINT survey_surveyuser_pkey PRIMARY KEY (id);


--
-- Name: text_text_cmsplugin_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT text_text_cmsplugin_ptr_id_key UNIQUE (cmsplugin_ptr_id);


--
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: epiwork; Tablespace:
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_new_placeholder_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_new_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_publisher_state; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_publisher_state ON cms_page USING btree (publisher_state);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagemoderator_page_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagemoderator_page_id ON cms_pagemoderator USING btree (page_id);


--
-- Name: cms_pagemoderator_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagemoderator_user_id ON cms_pagemoderator USING btree (user_id);


--
-- Name: cms_pagemoderatorstate_page_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagemoderatorstate_page_id ON cms_pagemoderatorstate USING btree (page_id);


--
-- Name: cms_pagemoderatorstate_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagemoderatorstate_user_id ON cms_pagemoderatorstate USING btree (user_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_title_application_urls; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_application_urls ON cms_title USING btree (application_urls);


--
-- Name: cms_title_application_urls_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_application_urls_like ON cms_title USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cmsplugin_picture_page_link_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cmsplugin_picture_page_link_id ON cmsplugin_picture USING btree (page_link_id);


--
-- Name: cmsplugin_surveychartplugin_chart_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX cmsplugin_surveychartplugin_chart_id ON cmsplugin_surveychartplugin USING btree (chart_id);


--
-- Name: contest_prediction_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX contest_prediction_user_id ON contest_prediction USING btree (user_id);


--
-- Name: contest_week_prediction_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX contest_week_prediction_id ON contest_week USING btree (prediction_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_cache_expires; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX django_cache_expires ON django_cache USING btree (expires);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: journal_categorytranslation_language_code; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_categorytranslation_language_code ON journal_categorytranslation USING btree (language_code);


--
-- Name: journal_categorytranslation_language_code_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_categorytranslation_language_code_like ON journal_categorytranslation USING btree (language_code varchar_pattern_ops);


--
-- Name: journal_categorytranslation_master_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_categorytranslation_master_id ON journal_categorytranslation USING btree (master_id);


--
-- Name: journal_entry_category_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_entry_category_id ON journal_entry USING btree (category_id);


--
-- Name: journal_entry_slug; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_entry_slug ON journal_entry USING btree (slug);


--
-- Name: journal_entry_slug_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_entry_slug_like ON journal_entry USING btree (slug varchar_pattern_ops);


--
-- Name: journal_entrytranslation_language_code; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_entrytranslation_language_code ON journal_entrytranslation USING btree (language_code);


--
-- Name: journal_entrytranslation_language_code_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_entrytranslation_language_code_like ON journal_entrytranslation USING btree (language_code varchar_pattern_ops);


--
-- Name: journal_entrytranslation_master_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_entrytranslation_master_id ON journal_entrytranslation USING btree (master_id);


--
-- Name: journal_latestentryplugin_category_category_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_latestentryplugin_category_category_id ON journal_latestentryplugin_category USING btree (category_id);


--
-- Name: journal_latestentryplugin_category_latestentryplugin_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX journal_latestentryplugin_category_latestentryplugin_id ON journal_latestentryplugin_category USING btree (latestentryplugin_id);


--
-- Name: link_link_page_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX link_link_page_id ON cmsplugin_link USING btree (page_link_id);


--
-- Name: loginurl_key_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX loginurl_key_user_id ON loginurl_key USING btree (user_id);


--
-- Name: pollster_chart_shortname; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_chart_shortname ON pollster_chart USING btree (shortname);


--
-- Name: pollster_chart_shortname_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_chart_shortname_like ON pollster_chart USING btree (shortname varchar_pattern_ops);


--
-- Name: pollster_chart_survey_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_chart_survey_id ON pollster_chart USING btree (survey_id);


--
-- Name: pollster_chart_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_chart_type_id ON pollster_chart USING btree (type_id);


--
-- Name: pollster_option_clone_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_option_clone_id ON pollster_option USING btree (clone_id);


--
-- Name: pollster_option_column_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_option_column_id ON pollster_option USING btree (column_id);


--
-- Name: pollster_option_question_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_option_question_id ON pollster_option USING btree (question_id);


--
-- Name: pollster_option_row_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_option_row_id ON pollster_option USING btree (row_id);


--
-- Name: pollster_option_virtual_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_option_virtual_type_id ON pollster_option USING btree (virtual_type_id);


--
-- Name: pollster_question_data_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_question_data_type_id ON pollster_question USING btree (data_type_id);


--
-- Name: pollster_question_open_option_data_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_question_open_option_data_type_id ON pollster_question USING btree (open_option_data_type_id);


--
-- Name: pollster_question_survey_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_question_survey_id ON pollster_question USING btree (survey_id);


--
-- Name: pollster_questioncolumn_question_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_questioncolumn_question_id ON pollster_questioncolumn USING btree (question_id);


--
-- Name: pollster_questionrow_question_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_questionrow_question_id ON pollster_questionrow USING btree (question_id);


--
-- Name: pollster_rule_object_options_option_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_object_options_option_id ON pollster_rule_object_options USING btree (option_id);


--
-- Name: pollster_rule_object_options_rule_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_object_options_rule_id ON pollster_rule_object_options USING btree (rule_id);


--
-- Name: pollster_rule_object_question_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_object_question_id ON pollster_rule USING btree (object_question_id);


--
-- Name: pollster_rule_rule_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_rule_type_id ON pollster_rule USING btree (rule_type_id);


--
-- Name: pollster_rule_subject_options_option_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_subject_options_option_id ON pollster_rule_subject_options USING btree (option_id);


--
-- Name: pollster_rule_subject_options_rule_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_subject_options_rule_id ON pollster_rule_subject_options USING btree (rule_id);


--
-- Name: pollster_rule_subject_question_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_rule_subject_question_id ON pollster_rule USING btree (subject_question_id);


--
-- Name: pollster_survey_parent_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_survey_parent_id ON pollster_survey USING btree (parent_id);


--
-- Name: pollster_survey_shortname; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_survey_shortname ON pollster_survey USING btree (shortname);


--
-- Name: pollster_survey_shortname_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_survey_shortname_like ON pollster_survey USING btree (shortname varchar_pattern_ops);


--
-- Name: pollster_survey_version; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_survey_version ON pollster_survey USING btree (version);


--
-- Name: pollster_survey_version_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_survey_version_like ON pollster_survey USING btree (version varchar_pattern_ops);


--
-- Name: pollster_translationoption_option_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationoption_option_id ON pollster_translationoption USING btree (option_id);


--
-- Name: pollster_translationoption_translation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationoption_translation_id ON pollster_translationoption USING btree (translation_id);


--
-- Name: pollster_translationquestion_question_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationquestion_question_id ON pollster_translationquestion USING btree (question_id);


--
-- Name: pollster_translationquestion_translation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationquestion_translation_id ON pollster_translationquestion USING btree (translation_id);


--
-- Name: pollster_translationquestioncolumn_column_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationquestioncolumn_column_id ON pollster_translationquestioncolumn USING btree (column_id);


--
-- Name: pollster_translationquestioncolumn_translation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationquestioncolumn_translation_id ON pollster_translationquestioncolumn USING btree (translation_id);


--
-- Name: pollster_translationquestionrow_row_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationquestionrow_row_id ON pollster_translationquestionrow USING btree (row_id);


--
-- Name: pollster_translationquestionrow_translation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationquestionrow_translation_id ON pollster_translationquestionrow USING btree (translation_id);


--
-- Name: pollster_translationsurvey_language; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationsurvey_language ON pollster_translationsurvey USING btree (language);


--
-- Name: pollster_translationsurvey_language_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationsurvey_language_like ON pollster_translationsurvey USING btree (language varchar_pattern_ops);


--
-- Name: pollster_translationsurvey_survey_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_translationsurvey_survey_id ON pollster_translationsurvey USING btree (survey_id);


--
-- Name: pollster_virtualoptiontype_question_data_type_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX pollster_virtualoptiontype_question_data_type_id ON pollster_virtualoptiontype USING btree (question_data_type_id);


--
-- Name: reminder_newslettertemplatetranslation_language_code; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_newslettertemplatetranslation_language_code ON reminder_newslettertemplatetranslation USING btree (language_code);


--
-- Name: reminder_newslettertemplatetranslation_language_code_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_newslettertemplatetranslation_language_code_like ON reminder_newslettertemplatetranslation USING btree (language_code varchar_pattern_ops);


--
-- Name: reminder_newslettertemplatetranslation_master_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_newslettertemplatetranslation_master_id ON reminder_newslettertemplatetranslation USING btree (master_id);


--
-- Name: reminder_newslettertranslation_language_code; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_newslettertranslation_language_code ON reminder_newslettertranslation USING btree (language_code);


--
-- Name: reminder_newslettertranslation_language_code_like; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_newslettertranslation_language_code_like ON reminder_newslettertranslation USING btree (language_code varchar_pattern_ops);


--
-- Name: reminder_newslettertranslation_master_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_newslettertranslation_master_id ON reminder_newslettertranslation USING btree (master_id);


--
-- Name: reminder_remindererror_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX reminder_remindererror_user_id ON reminder_remindererror USING btree (user_id);


--
-- Name: snippet_snippetptr_snippet_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX snippet_snippetptr_snippet_id ON cmsplugin_snippetptr USING btree (snippet_id);


--
-- Name: survey_lastresponse_participation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_lastresponse_participation_id ON survey_lastresponse USING btree (participation_id);


--
-- Name: survey_localflusurvey_surveyuser_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_localflusurvey_surveyuser_id ON survey_localflusurvey USING btree (surveyuser_id);


--
-- Name: survey_participation_previous_participation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_participation_previous_participation_id ON survey_participation USING btree (previous_participation_id);


--
-- Name: survey_participation_survey_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_participation_survey_id ON survey_participation USING btree (survey_id);


--
-- Name: survey_participation_user_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_participation_user_id ON survey_participation USING btree (user_id);


--
-- Name: survey_profile_survey_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_profile_survey_id ON survey_profile USING btree (survey_id);


--
-- Name: survey_profilesendqueue_owner_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_profilesendqueue_owner_id ON survey_profilesendqueue USING btree (owner_id);


--
-- Name: survey_responsesendqueue_participation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_responsesendqueue_participation_id ON survey_responsesendqueue USING btree (participation_id);


--
-- Name: survey_surveyuser_last_participation_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_surveyuser_last_participation_id ON survey_surveyuser USING btree (last_participation_id);


--
-- Name: survey_surveyuser_oneuser_id; Type: INDEX; Schema: public; Owner: epiwork; Tablespace:
--

CREATE INDEX survey_surveyuser_oneuser_id ON survey_surveyuser USING btree (user_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_337c5c92; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_entry
    ADD CONSTRAINT category_id_refs_id_337c5c92 FOREIGN KEY (category_id) REFERENCES journal_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_5eb9b850; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_latestentryplugin_category
    ADD CONSTRAINT category_id_refs_id_5eb9b850 FOREIGN KEY (category_id) REFERENCES journal_category(id) DEFERRABLE INITIALLY DEFERRED;




--
-- Name: chart_id_refs_id_27d4c608; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_surveychartplugin
    ADD CONSTRAINT chart_id_refs_id_27d4c608 FOREIGN KEY (chart_id) REFERENCES pollster_chart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clone_id_refs_id_6e9c6919; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_option
    ADD CONSTRAINT clone_id_refs_id_6e9c6919 FOREIGN KEY (clone_id) REFERENCES pollster_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_23cceaf6; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_23cceaf6 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_30503b22; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_30503b22 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_40687f44; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_40687f44 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_416b5422; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_latestentryplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_416b5422 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_41b0b305; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_surveychartplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_41b0b305 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_447cf852; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_447cf852 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_4e1e937b; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_contestplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_4e1e937b FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_62cab895; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_62cab895 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: column_id_refs_id_2bc8c06d; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestioncolumn
    ADD CONSTRAINT column_id_refs_id_2bc8c06d FOREIGN KEY (column_id) REFERENCES pollster_questioncolumn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: column_id_refs_id_6886f450; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_option
    ADD CONSTRAINT column_id_refs_id_6886f450 FOREIGN KEY (column_id) REFERENCES pollster_questioncolumn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: created_by_id_refs_id_16b8b1ea; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT created_by_id_refs_id_16b8b1ea FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: created_by_id_refs_id_3dc63396; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT created_by_id_refs_id_3dc63396 FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: data_type_id_refs_id_a6f9a5d; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_question
    ADD CONSTRAINT data_type_id_refs_id_a6f9a5d FOREIGN KEY (data_type_id) REFERENCES pollster_questiondatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;



--
-- Name: globalpagepermission_id_refs_id_2c730e06; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_2c730e06 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_2c9c6fcd; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT group_id_refs_id_2c9c6fcd FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_4edd8708; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT group_id_refs_id_4edd8708 FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_ptr_id_refs_id_661a1ca9; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT group_ptr_id_refs_id_661a1ca9 FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: last_participation_id_refs_id_5f9dfa74; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_surveyuser
    ADD CONSTRAINT last_participation_id_refs_id_5f9dfa74 FOREIGN KEY (last_participation_id) REFERENCES survey_participation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: latestentryplugin_id_refs_cmsplugin_ptr_id_34ff8a5a; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_latestentryplugin_category
    ADD CONSTRAINT latestentryplugin_id_refs_cmsplugin_ptr_id_34ff8a5a FOREIGN KEY (latestentryplugin_id) REFERENCES cmsplugin_latestentryplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: loginurl_key_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY loginurl_key
    ADD CONSTRAINT loginurl_key_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_id_refs_id_146b455f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_newslettertemplatetranslation
    ADD CONSTRAINT master_id_refs_id_146b455f FOREIGN KEY (master_id) REFERENCES reminder_newslettertemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_id_refs_id_41cdc6a9; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_newslettertranslation
    ADD CONSTRAINT master_id_refs_id_41cdc6a9 FOREIGN KEY (master_id) REFERENCES reminder_newsletter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_id_refs_id_66145f57; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_categorytranslation
    ADD CONSTRAINT master_id_refs_id_66145f57 FOREIGN KEY (master_id) REFERENCES journal_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: master_id_refs_id_67b4fb1f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY journal_entrytranslation
    ADD CONSTRAINT master_id_refs_id_67b4fb1f FOREIGN KEY (master_id) REFERENCES journal_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: new_placeholder_id_refs_id_209446bc; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT new_placeholder_id_refs_id_209446bc FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_question_id_refs_id_88e3e97; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule
    ADD CONSTRAINT object_question_id_refs_id_88e3e97 FOREIGN KEY (object_question_id) REFERENCES pollster_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oneuser_id_refs_id_7401b9cd; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_surveyuser
    ADD CONSTRAINT oneuser_id_refs_id_7401b9cd FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: open_option_data_type_id_refs_id_a6f9a5d; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_question
    ADD CONSTRAINT open_option_data_type_id_refs_id_a6f9a5d FOREIGN KEY (open_option_data_type_id) REFERENCES pollster_questiondatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: option_id_refs_id_1af43a6e; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule_subject_options
    ADD CONSTRAINT option_id_refs_id_1af43a6e FOREIGN KEY (option_id) REFERENCES pollster_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: option_id_refs_id_2d909dbd; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationoption
    ADD CONSTRAINT option_id_refs_id_2d909dbd FOREIGN KEY (option_id) REFERENCES pollster_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: option_id_refs_id_349a21c0; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule_object_options
    ADD CONSTRAINT option_id_refs_id_349a21c0 FOREIGN KEY (option_id) REFERENCES pollster_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_70bc3a9e; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_profilesendqueue
    ADD CONSTRAINT owner_id_refs_id_70bc3a9e FOREIGN KEY (owner_id) REFERENCES survey_surveyuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_2ce5c936; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT page_id_refs_id_2ce5c936 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_2fdf9e90; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT page_id_refs_id_2fdf9e90 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_36799a1; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT page_id_refs_id_36799a1 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_4dd4551b; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_4dd4551b FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_6d4379fb; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagemoderator
    ADD CONSTRAINT page_id_refs_id_6d4379fb FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_b236163; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT page_id_refs_id_b236163 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_74758dc2; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT page_link_id_refs_id_74758dc2 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_1f4cd5fd; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT parent_id_refs_id_1f4cd5fd FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_253ea6c3; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_survey
    ADD CONSTRAINT parent_id_refs_id_253ea6c3 FOREIGN KEY (parent_id) REFERENCES pollster_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_653a773; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT parent_id_refs_id_653a773 FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: participation_id_refs_id_12d1ef94; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_responsesendqueue
    ADD CONSTRAINT participation_id_refs_id_12d1ef94 FOREIGN KEY (participation_id) REFERENCES survey_participation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: participation_id_refs_id_24240164; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_lastresponse
    ADD CONSTRAINT participation_id_refs_id_24240164 FOREIGN KEY (participation_id) REFERENCES survey_participation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: placeholder_id_refs_id_4f20b6a0; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT placeholder_id_refs_id_4f20b6a0 FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;



--
-- Name: prediction_id_refs_id_7396a312; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY contest_week
    ADD CONSTRAINT prediction_id_refs_id_7396a312 FOREIGN KEY (prediction_id) REFERENCES contest_prediction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: previous_participation_id_refs_id_63e71195; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_participation
    ADD CONSTRAINT previous_participation_id_refs_id_63e71195 FOREIGN KEY (previous_participation_id) REFERENCES survey_participation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_653a773; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT publisher_public_id_refs_id_653a773 FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: question_data_type_id_refs_id_f95fc80; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_virtualoptiontype
    ADD CONSTRAINT question_data_type_id_refs_id_f95fc80 FOREIGN KEY (question_data_type_id) REFERENCES pollster_questiondatatype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: question_id_refs_id_265340b5; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_questioncolumn
    ADD CONSTRAINT question_id_refs_id_265340b5 FOREIGN KEY (question_id) REFERENCES pollster_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: question_id_refs_id_461e646f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestion
    ADD CONSTRAINT question_id_refs_id_461e646f FOREIGN KEY (question_id) REFERENCES pollster_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: question_id_refs_id_6c315aa0; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_option
    ADD CONSTRAINT question_id_refs_id_6c315aa0 FOREIGN KEY (question_id) REFERENCES pollster_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: question_id_refs_id_746417dc; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_questionrow
    ADD CONSTRAINT question_id_refs_id_746417dc FOREIGN KEY (question_id) REFERENCES pollster_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: row_id_refs_id_52e0261b; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_option
    ADD CONSTRAINT row_id_refs_id_52e0261b FOREIGN KEY (row_id) REFERENCES pollster_questionrow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: row_id_refs_id_6178b6b9; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestionrow
    ADD CONSTRAINT row_id_refs_id_6178b6b9 FOREIGN KEY (row_id) REFERENCES pollster_questionrow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rule_id_refs_id_32ce58e3; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule_subject_options
    ADD CONSTRAINT rule_id_refs_id_32ce58e3 FOREIGN KEY (rule_id) REFERENCES pollster_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rule_id_refs_id_98a554b; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule_object_options
    ADD CONSTRAINT rule_id_refs_id_98a554b FOREIGN KEY (rule_id) REFERENCES pollster_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rule_type_id_refs_id_26c50e47; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule
    ADD CONSTRAINT rule_type_id_refs_id_26c50e47 FOREIGN KEY (rule_type_id) REFERENCES pollster_ruletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_128f08e6; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT site_id_refs_id_128f08e6 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_2d3a9c18; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_remindersettings
    ADD CONSTRAINT site_id_refs_id_2d3a9c18 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_2e87f41f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY partnersites_sitesettings
    ADD CONSTRAINT site_id_refs_id_2e87f41f FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_38dfe611; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT site_id_refs_id_38dfe611 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: snippet_id_refs_id_316aed32; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT snippet_id_refs_id_316aed32 FOREIGN KEY (snippet_id) REFERENCES snippet_snippet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subject_question_id_refs_id_88e3e97; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_rule
    ADD CONSTRAINT subject_question_id_refs_id_88e3e97 FOREIGN KEY (subject_question_id) REFERENCES pollster_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey_id_refs_id_2a639536; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_chart
    ADD CONSTRAINT survey_id_refs_id_2a639536 FOREIGN KEY (survey_id) REFERENCES pollster_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey_id_refs_id_2ccb4439; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationsurvey
    ADD CONSTRAINT survey_id_refs_id_2ccb4439 FOREIGN KEY (survey_id) REFERENCES pollster_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey_id_refs_id_52cde093; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_participation
    ADD CONSTRAINT survey_id_refs_id_52cde093 FOREIGN KEY (survey_id) REFERENCES survey_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey_id_refs_id_7cdfa605; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_profile
    ADD CONSTRAINT survey_id_refs_id_7cdfa605 FOREIGN KEY (survey_id) REFERENCES survey_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: survey_id_refs_id_d1949d1; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_question
    ADD CONSTRAINT survey_id_refs_id_d1949d1 FOREIGN KEY (survey_id) REFERENCES pollster_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveyuser_id_refs_id_65f4270c; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_localflusurvey
    ADD CONSTRAINT surveyuser_id_refs_id_65f4270c FOREIGN KEY (surveyuser_id) REFERENCES survey_surveyuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: surveyuser_id_refs_id_68347cd8; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_localprofile
    ADD CONSTRAINT surveyuser_id_refs_id_68347cd8 FOREIGN KEY (surveyuser_id) REFERENCES survey_surveyuser(id) DEFERRABLE INITIALLY DEFERRED;

--
-- Name: translation_id_refs_id_368b5a6c; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestionrow
    ADD CONSTRAINT translation_id_refs_id_368b5a6c FOREIGN KEY (translation_id) REFERENCES pollster_translationsurvey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: translation_id_refs_id_3c8cd947; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestion
    ADD CONSTRAINT translation_id_refs_id_3c8cd947 FOREIGN KEY (translation_id) REFERENCES pollster_translationsurvey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: translation_id_refs_id_4aa430bb; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationquestioncolumn
    ADD CONSTRAINT translation_id_refs_id_4aa430bb FOREIGN KEY (translation_id) REFERENCES pollster_translationsurvey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: translation_id_refs_id_513cb70c; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_translationoption
    ADD CONSTRAINT translation_id_refs_id_513cb70c FOREIGN KEY (translation_id) REFERENCES pollster_translationsurvey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: type_id_refs_id_c6c4541; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_chart
    ADD CONSTRAINT type_id_refs_id_c6c4541 FOREIGN KEY (type_id) REFERENCES pollster_charttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_1663bc1a; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_participation
    ADD CONSTRAINT user_id_refs_id_1663bc1a FOREIGN KEY (user_id) REFERENCES survey_surveyuser(id) DEFERRABLE INITIALLY DEFERRED;




--
-- Name: user_id_refs_id_2808fb19; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT user_id_refs_id_2808fb19 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_3a8b1d7f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagemoderator
    ADD CONSTRAINT user_id_refs_id_3a8b1d7f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4c3c8bce; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY contest_prediction
    ADD CONSTRAINT user_id_refs_id_4c3c8bce FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4f0ab76c; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT user_id_refs_id_4f0ab76c FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_54dfc11c; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_profile
    ADD CONSTRAINT user_id_refs_id_54dfc11c FOREIGN KEY (user_id) REFERENCES survey_surveyuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_6b067e56; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_userreminderinfo
    ADD CONSTRAINT user_id_refs_id_6b067e56 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_72e4cb23; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY reminder_remindererror
    ADD CONSTRAINT user_id_refs_id_72e4cb23 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_7ceef80f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_7ceef80f FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_ac9af97; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT user_id_refs_id_ac9af97 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_dfbab7d; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_dfbab7d FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_ec98543; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY survey_lastresponse
    ADD CONSTRAINT user_id_refs_id_ec98543 FOREIGN KEY (user_id) REFERENCES survey_surveyuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_ptr_id_refs_id_16b8b1ea; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT user_ptr_id_refs_id_16b8b1ea FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtual_type_id_refs_id_54007e5f; Type: FK CONSTRAINT; Schema: public; Owner: epiwork
--

ALTER TABLE ONLY pollster_option
    ADD CONSTRAINT virtual_type_id_refs_id_54007e5f FOREIGN KEY (virtual_type_id) REFERENCES pollster_virtualoptiontype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
