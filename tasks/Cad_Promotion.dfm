inherited CadPromotion: TCadPromotion
  ClientHeight = 514
  ClientWidth = 798
  Caption = 'Cadastro de Promo'#231#227'o'
  ExplicitWidth = 814
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 450
    Width = 798
    ExplicitTop = 450
    ExplicitWidth = 798
  end
  inherited pnl_fundo: TUniPanel
    Width = 798
    Height = 450
    ExplicitWidth = 798
    ExplicitHeight = 450
    object pnl_fundo_linha_1: TUniPanel
      Left = 2
      Top = 2
      Width = 794
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      object E_promocao: TUniEdit
        AlignWithMargins = True
        Left = 418
        Top = 3
        Width = 373
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        ParentShowHint = False
        Text = ''
        Align = alClient
        TabOrder = 2
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Promo'#231#227'o'
        FieldLabelAlign = laTop
      end
      object e_Quantidade: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 141
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 0
        FieldLabel = 'Quantidade'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
        OnExit = e_QuantidadeExit
      end
      object E_Valor: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 284
        Top = 3
        Width = 128
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 3
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Valor Unit'#225'rio'
        FieldLabelAlign = laTop
        DecimalPrecision = 4
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object E_ValorTotal: TUniFormattedNumberEdit
        AlignWithMargins = True
        Left = 150
        Top = 3
        Width = 128
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Alignment = taRightJustify
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Valor Total'
        FieldLabelAlign = laTop
        DecimalSeparator = ','
        ThousandSeparator = '.'
        OnExit = E_ValorTotalExit
      end
    end
    object pnl_fundo_linha_2: TUniPanel
      Left = 2
      Top = 54
      Width = 794
      Height = 71
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object E_Cd_Barras: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 22
        Width = 173
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        ParentShowHint = False
        Text = ''
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'C'#243'digo de Barras'
        FieldLabelAlign = laTop
        OnExit = E_Cd_BarrasExit
      end
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 259
        Height = 13
        Hint = ''
        Caption = 'Informe os produtos que participar'#227'o desta promo'#231#227'o'
        Align = alTop
        TabOrder = 2
      end
      object E_Produto: TUniEdit
        AlignWithMargins = True
        Left = 182
        Top = 22
        Width = 580
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        ParentShowHint = False
        Text = ''
        Align = alClient
        TabOrder = 3
        TabStop = False
        ReadOnly = True
        FieldLabel = 'Promo'#231#227'o'
        FieldLabelAlign = laTop
      end
      object Sb_Search: TUniSpeedButton
        AlignWithMargins = True
        Left = 768
        Top = 41
        Width = 23
        Height = 27
        Hint = ''
        Margins.Top = 22
        Caption = ''
        Align = alRight
        ParentColor = False
        Color = clWindow
        TabOrder = 4
        OnClick = Sb_SearchClick
      end
    end
    object pnl_fundo_linha_3: TUniPanel
      Left = 2
      Top = 125
      Width = 794
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      ExplicitTop = 122
      DesignSize = (
        794
        52)
      object Sb_Ins_Produto: TUniBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 135
        Height = 46
        Hint = ''
        Caption = 'Novo Produto'
        Align = alLeft
        TabOrder = 1
        OnClick = Sb_Ins_ProdutoClick
      end
      object Sb_Exc_Produto: TUniBitBtn
        AlignWithMargins = True
        Left = 144
        Top = 3
        Width = 130
        Height = 46
        Hint = ''
        Caption = 'Excluir Produto'
        Align = alLeft
        TabOrder = 2
        OnClick = Sb_Exc_ProdutoClick
      end
      object ChBx_Ativa: TUniCheckBox
        Left = 696
        Top = 6
        Width = 95
        Height = 17
        Hint = ''
        Caption = 'Promo'#231#227'o ativa'
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
    end
    object DBG_Produtos: TUniDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 180
      Width = 788
      Height = 265
      Hint = ''
      DataSource = Ds_promotion_itens
      WebOptions.Paged = False
      WebOptions.CustomizableCells = False
      LoadMask.Message = 'Carregando dados...'
      Align = alClient
      Font.Color = clBlack
      ParentFont = False
      TabOrder = 4
      Columns = <
        item
          FieldName = 'tb_product_id'
          Title.Caption = 'C'#243'digo do Produto'
          Width = 112
          Font.Color = clNavy
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 541
          Font.Color = clNavy
        end>
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 96
    Top = 176
  end
  inherited ds_msg: TDataSource
    Left = 96
    Top = 232
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 168
  end
  object cds_promotion_itens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 215
    object cds_promotion_itenstb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      Required = True
    end
    object cds_promotion_itenstb_promotion_id: TIntegerField
      FieldName = 'tb_promotion_id'
      Origin = 'tb_promotion_id'
      Required = True
    end
    object cds_promotion_itenstb_product_id: TIntegerField
      FieldName = 'tb_product_id'
      Required = True
    end
    object cds_promotion_itensdescription: TStringField
      FieldName = 'description'
      Required = True
      Size = 100
    end
  end
  object Ds_promotion_itens: TDataSource
    AutoEdit = False
    DataSet = cds_promotion_itens
    Left = 464
    Top = 264
  end
end
