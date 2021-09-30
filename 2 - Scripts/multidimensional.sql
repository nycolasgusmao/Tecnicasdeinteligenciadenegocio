
CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                dia INTEGER NOT NULL,
                mes INTEGER NOT NULL,
                ano INTEGER NOT NULL,
                CONSTRAINT sk_data_pk PRIMARY KEY (sk_data)
);


CREATE SEQUENCE public.dm_avaliacao_sk_avaliacao_seq;

CREATE TABLE public.dm_avaliacao (
                sk_avaliacao INTEGER NOT NULL DEFAULT nextval('public.dm_avaliacao_sk_avaliacao_seq'),
                nk_avaliacao VARCHAR NOT NULL,
                nota INTEGER NOT NULL,
                classificacao VARCHAR(10) NOT NULL,
                CONSTRAINT sk_avaliacao PRIMARY KEY (sk_avaliacao)
);


ALTER SEQUENCE public.dm_avaliacao_sk_avaliacao_seq OWNED BY public.dm_avaliacao.sk_avaliacao;

CREATE SEQUENCE public.dim_cliente_sk_cliente_seq;

CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                empresa VARCHAR(10) NOT NULL,
                dt_nascimento DATE NOT NULL,
                local VARCHAR(50) NOT NULL,
                CONSTRAINT sk_cliente_pk PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE public.dim_cliente_sk_cliente_seq OWNED BY public.dim_cliente.sk_cliente;

CREATE SEQUENCE public.dim_equipamento_sk_equipamento_seq;

CREATE TABLE public.dim_equipamento (
                sk_equipamento INTEGER NOT NULL DEFAULT nextval('public.dim_equipamento_sk_equipamento_seq'),
                nk_equipamento INTEGER NOT NULL,
                Modelo VARCHAR(50) NOT NULL,
                preco NUMERIC(10,2) NOT NULL,
                CONSTRAINT sk_equipamento_pk PRIMARY KEY (sk_equipamento)
);


ALTER SEQUENCE public.dim_equipamento_sk_equipamento_seq OWNED BY public.dim_equipamento.sk_equipamento;

CREATE TABLE public.ft_pedido (
                sk_equipamento INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_avaliacao INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_codpedido INTEGER NOT NULL,
                dd_horapedido TIME NOT NULL,
                md_qtd INTEGER NOT NULL,
                md_desconto INTEGER NOT NULL,
                md_valor_total REAL NOT NULL
);


ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_data_ft_pedido_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_pedido ADD CONSTRAINT dm_avaliacao_ft_pedido_fk
FOREIGN KEY (sk_avaliacao)
REFERENCES public.dm_avaliacao (sk_avaliacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_cliente_ft_pedido_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_equipamento_ft_pedido_fk
FOREIGN KEY (sk_equipamento)
REFERENCES public.dim_equipamento (sk_equipamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;