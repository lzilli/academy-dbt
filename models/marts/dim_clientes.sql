with
    clientes as(
        select *
        from {{ ref('stg_sap__clientes') }}
    )
    
    , businessentity as (
        select *
        from {{ ref('stg_sap__businessentity') }}
    )

    , businessentityaddress as (
        select *
        from {{ ref('stg_sap__businessentityaddress') }}
    )

    , enderecos as (
        select *
        from {{ ref('stg_sap__enderecos') }}
    )

    , estados as (
        select *
        from {{ ref('stg_sap__estados') }}
    )

    , paises as (
        select *
        from {{ ref('stg_sap__paises') }}
    )
    
    , cartoesclientes as (
        select *
        from {{ ref('stg_sap__cartoesclientes') }}
    )

    , cartoescredito as (
        select *
        from {{ ref('stg_sap__cartoescredito') }}
    )

    , infclientes as (
        select *
        from {{ ref('stg_sap__infclientes') }}
    )

    , businessentitycontact as (
        select *
        from {{ ref('stg_sap__businessentitycontact') }}
    )

    , join_tabelas as (
        select
        clientes.id_cliente	
        , clientes.nome_cliente
        , cartoesclientes.id_cartaocredito_cartoescliente
        , businessentitycontact.id_pessoa_businessentitycontact
        , cartoescredito.tipocartao_cartoescredito
        --, businessentityaddress.id_endereco_businessentityaddress
        , enderecos.cidade_endereco
        --, enderecos.id_estado_endereco
        , estados.nome_estado	
        --, estados.codigo_pais_estado
        , paises.nome_pais
        

        from clientes 
        left join cartoesclientes on
            clientes.id_cliente = cartoesclientes.id_cliente_cartoescliente
        left join businessentitycontact on
            clientes.id_cliente = businessentitycontact.id_cliente_businessentitycontact
        left join businessentityaddress on
            clientes.id_cliente = businessentityaddress.id_cliente_businessentityaddress
        left join cartoescredito on
            cartoescredito.id_cartaocredito_cartoescredito	= cartoesclientes.id_cartaocredito_cartoescliente
        left join enderecos on
            enderecos.id_endereco_endereco = businessentityaddress.id_endereco_businessentityaddress
        left join estados on
             estados.id_estado_estado = enderecos.id_estado_endereco
        left join paises on
            paises.codigo_pais_pais	= estados.codigo_pais_estado
        --left join infclientes on
        --    infclientes.id_pessoa_clientesinf = businessentitycontact.id_pessoa_businessentitycontact
    )
    
   , transformacoes as (
    select
        row_number() over (order by id_cliente) as sk_cliente
        , *
    from join_tabelas
   )
select *
from transformacoes

