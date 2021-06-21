object SM: TSM
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 598
  Width = 847
  object Qr_Emitente: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select en.id, '
      'en.name_company, en.nick_trade,'
      'co.cnpj, co.ie, co.crt,'
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , ad.tb_state_id, st.abbreviation state , cy.nam' +
        'e city_desc  ,cy.ibge, ph.number phone,ph.kind,'
      'ad.zip_code, ad.tb_country_id, ct.name country_desc '
      'from tb_entity en'
      '  inner join tb_company co'
      '  on (co.id = en.id)'
      '  inner join tb_address ad'
      '  on (ad.id = en.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = en.id)'
      'where en.id =:entity_id'
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'ENTITY_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Destinatario: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select en.id,'
      'en.name_company, en.nick_trade,'
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , ad.tb_state_id, st.abbreviation state , cy.nam' +
        'e city_desc  ,cy.ibge, ph.number phone,ph.kind,'
      'ad.zip_code, ad.tb_country_id, ct.name country_desc '
      'from tb_entity en  '
      '  inner join tb_address ad'
      '  on (ad.id = en.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = en.id)'
      'where en.id =:entity_id'
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 120
    Top = 8
    ParamData = <
      item
        Name = 'ENTITY_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Company: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      
        'select id, cnpj, ie, im, iest, crt, crt_modal, ind_ie_destinatar' +
        'io,'
      'iss_ind_exig, iss_retencao, iss_inc_fiscal, iss_process_number,'
      'send_xml_nfe_only'
      'from tb_company co'
      'where co.id =:company_id')
    Left = 224
    Top = 8
    ParamData = <
      item
        Name = 'COMPANY_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Person: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select id,cpf,rg'
      'from tb_person pe'
      'where pe.id =:person_id'
      '')
    Left = 312
    Top = 8
    ParamData = <
      item
        Name = 'PERSON_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Customer: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select id,tb_vendor_id,  tb_carrier_id,  consumer,  by_pass_st'
      'from tb_customer cs'
      'where cs.id =:customer_id'
      '')
    Left = 392
    Top = 8
    ParamData = <
      item
        Name = 'CUSTOMER_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Items: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'Select '
      'oi.tb_order_id, oi.tb_institution_id,oi.id item_id,'
      
        'pr.id prod_id, pr.identifier,pr.description,me.ncm,sk.st,me.cest' +
        ', '
      
        'mea.description medida,sk.codebar, me.kind_tributary, me.source,' +
        ' '
      'oi.unit_value, oi.quantity,oi.discount_value,'
      'mea.abbreviation uCom ,'
      'pr.note'
      'from tb_order_item oi '
      '  inner join tb_product pr '
      '  on (pr.id = oi.tb_product_id) '
      '  and (pr.tb_institution_id = oi.tb_institution_id ) '
      '  inner join tb_merchandise me '
      '  on (me.id = pr.id) '
      '  and (me.tb_institution_id = oi.tb_institution_id ) '
      '  inner join tb_stock sk '
      '  on (sk.tb_merchandise_id = me.id) '
      '  and (sk.tb_institution_id = oi.tb_institution_id ) '
      '  inner join tb_measure mea '
      '  on (mea.id = sk.tb_measure_id) '
      'where ( oi.tb_institution_id  =:institution_id ) '
      ' and ( oi.tb_order_id = :order_id ) ')
    Left = 464
    Top = 8
    ParamData = <
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Tributacao: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 528
    Top = 8
  end
  object Qr_ST: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'SELECT mv.tb_state_id, mv.aliq_icms, mv.ncm, mv.mva '
      'FROM tb_mva_ncm mv'
      'WHERE mv.tb_state_id =:tb_state_id'
      'and mv.ncm=:ncm')
    Left = 608
    Top = 8
    ParamData = <
      item
        Name = 'TB_STATE_ID'
        ParamType = ptInput
      end
      item
        Name = 'NCM'
        ParamType = ptInput
      end>
  end
  object Qr_DeliveryLocal: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 120
    Top = 80
  end
  object Nfe: TACBrNFe
    Configuracoes.Geral.SSLLib = libCapicomDelphiSoap
    Configuracoes.Geral.SSLCryptLib = cryCapicom
    Configuracoes.Geral.SSLHttpLib = httpIndy
    Configuracoes.Geral.SSLXmlSignLib = xsMsXmlCapicom
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SalvarEvento = True
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = Dfe_Fortes
    Left = 32
    Top = 455
  end
  object Dfe_Fortes: TACBrNFeDANFeRL
    PathPDF = 'C:\Program Files\Borland\Delphi7\Bin\'
    Sistema = 'Setes - Gest'#227'o Computacional'
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrNFe = Nfe
    PosCanhoto = prRodape
    ExibeCampoFatura = False
    LarguraCodProd = 40
    AltLinhaComun = 20
    EspacoEntreProdutos = 0
    AlternaCoresProdutos = True
    TamanhoLogoHeight = 73
    TamanhoLogoWidth = 127
    LogoemCima = True
    Left = 120
    Top = 455
  end
  object Qr_Icms: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select ic.*'
      'from tb_order_item_icms ic'
      '  inner join tb_cfop cf'
      '  on (cf.id = ic.tb_cfop_id )'
      'where ic.tb_order_id =:order_id'
      'and ic.tb_order_item_id =:order_item_id'
      'and ic.tb_institution_id =:institution_id')
    Left = 31
    Top = 150
    ParamData = <
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Lote: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 32
    Top = 208
  end
  object Qr_Lote_Produzido: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 120
    Top = 208
  end
  object Qr_Serie_Produto: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 32
    Top = 264
  end
  object Qr_Icms_ST: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'SELECT'
      '  ic.mva,'
      '  ic.base_value_st,'
      '  ic.value_st    '
      'FROM tb_order_item_icms ic'
      'WHERE (ic.base_value_st > 0)'
      'and (ic.mva > 0)'
      'and (ic.value_st > 0)'
      'and ic.tb_order_id =:order_id'
      'and ic.tb_order_item_id =:order_item_id'
      'and ic.tb_institution_id =:institution_id')
    Left = 119
    Top = 150
    ParamData = <
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end>
  end
  object Qr_DI: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 32
    Top = 328
  end
  object Qr_DI_Adicao: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select it.id, co.cnpj, co.ie, '
      'ad.street,ad.nmbr, ad.complement,ad.zip_code,ad.neighborhood,'
      
        'ct.name country , st.name state , cy.name city  ,cy.ibge, ph.num' +
        'ber phone,ph.kind'
      'from tb_institution it'
      '  inner join tb_company co'
      '  on (co.id = it.id)'
      '  inner join tb_address ad'
      '  on (ad.id = it.id)'
      '  inner join tb_country ct'
      '  on (ct.id = ad.tb_country_id)'
      '  inner JOIN tb_state st'
      '  on (st.id = ad.tb_state_id)'
      '  inner join tb_city cy'
      '  on (cy.id = ad.tb_city_id)'
      '  left outer join tb_phone ph'
      '  on (ph.id = it.id)'
      'where it.id = 2  '
      'and ( (ph.kind = '#39'Fone'#39') or (ph.kind is null) )')
    Left = 120
    Top = 328
  end
  object Qr_Ipi: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select *'
      'from tb_order_item_ipi ip'
      'where ip.tb_order_id =:order_id'
      'and ip.tb_order_item_id =:order_item_id'
      'and ip.tb_institution_id =:institution_id')
    Left = 183
    Top = 150
    ParamData = <
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end>
  end
  object Qr_II: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select *'
      'from tb_order_item_ii ii'
      'where ii.tb_order_id =:order_id'
      'and ii.tb_order_item_id =:order_item_id'
      'and ii.tb_institution_id =:institution_id')
    Left = 247
    Top = 150
    ParamData = <
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Pis: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select *'
      'from tb_order_item_pis pi'
      'where pi.tb_order_id =:order_id'
      'and pi.tb_order_item_id =:order_item_id'
      'and pi.tb_institution_id =:institution_id')
    Left = 311
    Top = 150
    ParamData = <
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Cofins: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select *'
      'from tb_order_item_cofins cf'
      'where cf.tb_order_id =:order_id'
      'and cf.tb_order_item_id =:order_item_id'
      'and cf.tb_institution_id =:institution_id')
    Left = 375
    Top = 150
    ParamData = <
      item
        Name = 'ORDER_ID'
        ParamType = ptInput
      end
      item
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Transportadora: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      
        'select en.id, en.name_company, co.cnpj cnpjcpf,co.ie ierg, ad.st' +
        'reet,'
      'ad.nmbr, ad.zip_code, ct.name city_desc,'
      'st.abbreviation state,ad.nmbr'
      'FROM tb_entity en'
      '  inner join tb_company co'
      '  on (co.id = en.id)'
      '  inner join tb_address ad'
      '  on (ad.id = en.id)'
      '  INNER JOIN tb_city ct'
      '  ON (ct.id = ad.tb_city_id)'
      '  INNER JOIN tb_state st'
      '  ON (st.id = ad.tb_state_id)'
      'where en.id =:entity_id'
      'union'
      
        'select en.id, en.name_company, pe.cpf cnpjcpf, pe.rg ierg, ad.st' +
        'reet,'
      'ad.nmbr, ad.zip_code, ct.name city_desc,'
      'st.abbreviation state,ad.nmbr'
      'FROM tb_entity en'
      '  inner join tb_person pe'
      '  on (pe.id = en.id)'
      '  inner join tb_address ad'
      '  on (ad.id = en.id)'
      '  INNER JOIN tb_city ct'
      '  ON (ct.id = ad.tb_city_id)'
      '  INNER JOIN tb_state st'
      '  ON (st.id = ad.tb_state_id)'
      'where en.id =:entity_id')
    Left = 32
    Top = 392
    ParamData = <
      item
        Name = 'ENTITY_ID'
        ParamType = ptInput
      end>
  end
  object Qr_InvoiceShipping: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select '
      'ords.tb_freight_mode_id, '
      'ords.tb_carrier_id, '
      'ords.tb_address_id, '
      'invs.vehicle_plaque, '
      'invs.state_plaque, '
      'invs.rntc_plaque, '
      'invs.total_qtty, '
      'invs.sort_tag, '
      'invs.brand_tag, '
      'invs.gross_weight, '
      'invs.net_weight, '
      'invs.volume_number '
      'from tb_order_shipping ords '
      '  LEFT outer join tb_invoice_shipping invs '
      '  on (invs.id = ords.id) '
      '     and (invs.tb_institution_id = ords.tb_institution_id) '
      'where ( ords.tb_institution_id=:institution_id ) '
      ' and  ( ords.id=:invoice_id) ')
    Left = 224
    Top = 80
    ParamData = <
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end
      item
        Name = 'INVOICE_ID'
        ParamType = ptInput
      end>
  end
  object Qr_InvoiceObs: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'select DISTINCT obs'
      'from tb_invoice_obs ino'
      'where ino.tb_institution_id=:institution_id'
      'and ino.tb_invoice_id=:invoice_id')
    Left = 320
    Top = 80
    ParamData = <
      item
        Name = 'INSTITUTION_ID'
        ParamType = ptInput
      end
      item
        Name = 'INVOICE_ID'
        ParamType = ptInput
      end>
  end
  object Qr_Email: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'SELECT ma.email, mg.description'
      'from tb_mailing ma   '
      '  inner join tb_entity_has_mailing ehm '
      '  on (ehm.tb_mailing_id = ma.id) '
      '  inner join tb_mailing_group mg '
      '  on (mg.id = ehm.tb_mailing_group_id)'
      'where ma.id=:entity_id'
      'and mg.description=:description')
    Left = 672
    Top = 8
    ParamData = <
      item
        Name = 'ENTITY_ID'
        ParamType = ptInput
      end
      item
        Name = 'DESCRIPTION'
        ParamType = ptInput
      end>
  end
  object Qr_Midia_Social: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'SELECT id, link'
      'FROM tb_social_media'
      'where  id=:entity_id'
      'and kind=:kind')
    Left = 736
    Top = 8
    ParamData = <
      item
        Name = 'ENTITY_ID'
        ParamType = ptInput
      end
      item
        Name = 'KIND'
        ParamType = ptInput
      end>
  end
  object Qr_Msg_Retorno_Nfe: TFDQuery
    Filtered = True
    Connection = UMM.DB
    SQL.Strings = (
      'SELECT rm.id, rm.interno, rm.description'
      'FROM tb_msg_return_nfe rm        '
      'WHERE rm.id =:id')
    Left = 31
    Top = 518
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object Id_Mail: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = True
    SetTLS = True
    UseThread = True
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 232
    Top = 432
  end
end
