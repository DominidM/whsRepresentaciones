PGDMP  6    7                }            WHS    17.3    17.3 :    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                        1262    40965    WHS    DATABASE     k   CREATE DATABASE "WHS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE "WHS";
                     postgres    false            �            1259    40974 	   categoria    TABLE     g   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap r       postgres    false            �            1259    40973    categoria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public               postgres    false    220                       0    0    categoria_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;
          public               postgres    false    219            �            1259    40967    estado    TABLE     d   CREATE TABLE public.estado (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.estado;
       public         heap r       postgres    false            �            1259    40966    estado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.estado_id_seq;
       public               postgres    false    218                       0    0    estado_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;
          public               postgres    false    217            �            1259    40998    metodo_pago    TABLE     i   CREATE TABLE public.metodo_pago (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.metodo_pago;
       public         heap r       postgres    false            �            1259    40997    metodo_pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metodo_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.metodo_pago_id_seq;
       public               postgres    false    224                       0    0    metodo_pago_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.metodo_pago_id_seq OWNED BY public.metodo_pago.id;
          public               postgres    false    223            �            1259    41005    pedido    TABLE     �   CREATE TABLE public.pedido (
    id integer NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pk_metododepago integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap r       postgres    false            �            1259    41018    pedido_detalle    TABLE     �   CREATE TABLE public.pedido_detalle (
    id integer NOT NULL,
    cantidad integer NOT NULL,
    producto_id integer NOT NULL,
    pedido_id integer NOT NULL
);
 "   DROP TABLE public.pedido_detalle;
       public         heap r       postgres    false            �            1259    41017    pedido_detalle_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_detalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pedido_detalle_id_seq;
       public               postgres    false    228                       0    0    pedido_detalle_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pedido_detalle_id_seq OWNED BY public.pedido_detalle.id;
          public               postgres    false    227            �            1259    41004    pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pedido_id_seq;
       public               postgres    false    226                       0    0    pedido_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pedido_id_seq OWNED BY public.pedido.id;
          public               postgres    false    225            �            1259    40981    producto    TABLE     �   CREATE TABLE public.producto (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    price numeric(10,2) NOT NULL,
    pk_categoria integer NOT NULL,
    pk_estado integer NOT NULL
);
    DROP TABLE public.producto;
       public         heap r       postgres    false            �            1259    40980    producto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.producto_id_seq;
       public               postgres    false    222                       0    0    producto_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;
          public               postgres    false    221            �            1259    41080    queja    TABLE     (  CREATE TABLE public.queja (
    id integer NOT NULL,
    fecha timestamp without time zone DEFAULT now() NOT NULL,
    nombre_queja character varying(100) NOT NULL,
    dni_queja character varying(15) NOT NULL,
    correo_queja character varying(100) NOT NULL,
    telefono_queja character varying(20),
    producto_servicio character varying(50) NOT NULL,
    texto text NOT NULL,
    CONSTRAINT queja_producto_servicio_check CHECK (((producto_servicio)::text = ANY ((ARRAY['producto'::character varying, 'servicio'::character varying])::text[])))
);
    DROP TABLE public.queja;
       public         heap r       postgres    false            �            1259    41079    queja_id_seq    SEQUENCE     �   CREATE SEQUENCE public.queja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.queja_id_seq;
       public               postgres    false    230                       0    0    queja_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.queja_id_seq OWNED BY public.queja.id;
          public               postgres    false    229            @           2604    40977    categoria id    DEFAULT     l   ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            ?           2604    40970 	   estado id    DEFAULT     f   ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);
 8   ALTER TABLE public.estado ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            B           2604    41001    metodo_pago id    DEFAULT     p   ALTER TABLE ONLY public.metodo_pago ALTER COLUMN id SET DEFAULT nextval('public.metodo_pago_id_seq'::regclass);
 =   ALTER TABLE public.metodo_pago ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            C           2604    41008 	   pedido id    DEFAULT     f   ALTER TABLE ONLY public.pedido ALTER COLUMN id SET DEFAULT nextval('public.pedido_id_seq'::regclass);
 8   ALTER TABLE public.pedido ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    226    225    226            E           2604    41021    pedido_detalle id    DEFAULT     v   ALTER TABLE ONLY public.pedido_detalle ALTER COLUMN id SET DEFAULT nextval('public.pedido_detalle_id_seq'::regclass);
 @   ALTER TABLE public.pedido_detalle ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    228    228            A           2604    40984    producto id    DEFAULT     j   ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);
 :   ALTER TABLE public.producto ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            F           2604    41083    queja id    DEFAULT     d   ALTER TABLE ONLY public.queja ALTER COLUMN id SET DEFAULT nextval('public.queja_id_seq'::regclass);
 7   ALTER TABLE public.queja ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229    230            �          0    40974 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, nombre) FROM stdin;
    public               postgres    false    220   �A       �          0    40967    estado 
   TABLE DATA           ,   COPY public.estado (id, nombre) FROM stdin;
    public               postgres    false    218   �A       �          0    40998    metodo_pago 
   TABLE DATA           1   COPY public.metodo_pago (id, nombre) FROM stdin;
    public               postgres    false    224   �A       �          0    41005    pedido 
   TABLE DATA           <   COPY public.pedido (id, fecha, pk_metododepago) FROM stdin;
    public               postgres    false    226   B       �          0    41018    pedido_detalle 
   TABLE DATA           N   COPY public.pedido_detalle (id, cantidad, producto_id, pedido_id) FROM stdin;
    public               postgres    false    228   B       �          0    40981    producto 
   TABLE DATA           L   COPY public.producto (id, name, price, pk_categoria, pk_estado) FROM stdin;
    public               postgres    false    222   <B       �          0    41080    queja 
   TABLE DATA           {   COPY public.queja (id, fecha, nombre_queja, dni_queja, correo_queja, telefono_queja, producto_servicio, texto) FROM stdin;
    public               postgres    false    230   YB                  0    0    categoria_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);
          public               postgres    false    219            	           0    0    estado_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.estado_id_seq', 1, false);
          public               postgres    false    217            
           0    0    metodo_pago_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.metodo_pago_id_seq', 1, false);
          public               postgres    false    223                       0    0    pedido_detalle_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pedido_detalle_id_seq', 1, false);
          public               postgres    false    227                       0    0    pedido_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pedido_id_seq', 1, false);
          public               postgres    false    225                       0    0    producto_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.producto_id_seq', 1, false);
          public               postgres    false    221                       0    0    queja_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.queja_id_seq', 4, true);
          public               postgres    false    229            L           2606    40979    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public                 postgres    false    220            J           2606    40972    estado estado_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public                 postgres    false    218            P           2606    41003    metodo_pago metodo_pago_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.metodo_pago DROP CONSTRAINT metodo_pago_pkey;
       public                 postgres    false    224            T           2606    41023 "   pedido_detalle pedido_detalle_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT pedido_detalle_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pedido_detalle DROP CONSTRAINT pedido_detalle_pkey;
       public                 postgres    false    228            R           2606    41011    pedido pedido_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public                 postgres    false    226            N           2606    40986    producto producto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 postgres    false    222            V           2606    41089    queja queja_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.queja
    ADD CONSTRAINT queja_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.queja DROP CONSTRAINT queja_pkey;
       public                 postgres    false    230            Z           2606    41029 ,   pedido_detalle pedido_detalle_pedido_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT pedido_detalle_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedido(id);
 V   ALTER TABLE ONLY public.pedido_detalle DROP CONSTRAINT pedido_detalle_pedido_id_fkey;
       public               postgres    false    226    228    4690            [           2606    41024 .   pedido_detalle pedido_detalle_producto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido_detalle
    ADD CONSTRAINT pedido_detalle_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.producto(id);
 X   ALTER TABLE ONLY public.pedido_detalle DROP CONSTRAINT pedido_detalle_producto_id_fkey;
       public               postgres    false    4686    228    222            Y           2606    41012 "   pedido pedido_pk_metododepago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pk_metododepago_fkey FOREIGN KEY (pk_metododepago) REFERENCES public.metodo_pago(id);
 L   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pk_metododepago_fkey;
       public               postgres    false    224    4688    226            W           2606    40987 #   producto producto_pk_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pk_categoria_fkey FOREIGN KEY (pk_categoria) REFERENCES public.categoria(id);
 M   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pk_categoria_fkey;
       public               postgres    false    4684    220    222            X           2606    40992     producto producto_pk_estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pk_estado_fkey FOREIGN KEY (pk_estado) REFERENCES public.estado(id);
 J   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pk_estado_fkey;
       public               postgres    false    4682    222    218            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�}�Aj�0EףS�*lɖ�چR(4������bG���e�E�t�����@@���o�(P�*��tfj���4�T��kxi�Oq�r���T�xM�8���A�б���zzC��hw�:�4v���_�x)�%�#�x ��`���2e��-��6��N�%l9�;��I�zdlx�4ov,Eq	����->�&��1���T/�3������y����ֽ��5��yҏ!Ľ+)���xv     