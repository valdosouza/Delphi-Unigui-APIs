inherited CadMerchandise: TCadMerchandise
  ClientHeight = 487
  ClientWidth = 636
  Caption = 'Cadastro de Mercadoria'
  ExplicitWidth = 652
  ExplicitHeight = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 423
    Width = 636
    ExplicitTop = 423
    ExplicitWidth = 636
  end
  inherited pnl_fundo: TUniPanel
    Width = 636
    Height = 423
    ExplicitWidth = 636
    ExplicitHeight = 423
    inherited L_Codigo: TUniLabel
      TabOrder = 10
    end
    inherited L_NameCompany: TUniLabel
      TabOrder = 11
    end
    inherited E_Description: TUniEdit
      Width = 480
      ExplicitWidth = 480
    end
    inherited UniLabel1: TUniLabel
      TabOrder = 12
    end
    inherited E_Identifier: TUniEdit
      CharEOL = #13
      TabOrder = 1
    end
    inherited ctn_Category: TUniContainerPanel
      Width = 620
      Height = 36
      ExplicitWidth = 620
      ExplicitHeight = 36
    end
    inherited Pg_Main: TUniPageControl
      Width = 632
      Height = 290
      ActivePage = tbs_estoque
      ExplicitWidth = 632
      ExplicitHeight = 290
      object tbs_estoque: TUniTabSheet [0]
        Hint = ''
        Caption = 'Estoque'
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 624
          Height = 262
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object ctn_Brand: TUniContainerPanel
            Left = 4
            Top = 4
            Width = 305
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 1
          end
          object ctn_package: TUniContainerPanel
            Left = 4
            Top = 44
            Width = 305
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 2
          end
          object ctn_Measure: TUniContainerPanel
            Left = 315
            Top = 3
            Width = 303
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object ctn_color: TUniContainerPanel
            Left = 314
            Top = 44
            Width = 303
            Height = 36
            Hint = ''
            ParentColor = False
            TabOrder = 4
          end
          object UniLabel6: TUniLabel
            Left = 7
            Top = 92
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'Divisor'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object UniLabel7: TUniLabel
            Left = 75
            Top = 91
            Width = 92
            Height = 14
            Hint = ''
            Caption = 'Tipo do Mercadoria'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 6
          end
          object UniLabel13: TUniLabel
            Left = 239
            Top = 91
            Width = 61
            Height = 14
            Hint = ''
            Caption = 'Qtde. M'#237'nimo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 7
          end
          object E_Divisor: TUniEdit
            Left = 3
            Top = 107
            Width = 71
            Hint = ''
            Alignment = taRightJustify
            Text = '1'
            TabOrder = 8
          end
          object Cb_kind: TUniComboBox
            Left = 75
            Top = 107
            Width = 162
            Hint = ''
            Style = csDropDownList
            Text = 'Produto Acabado'
            Items.Strings = (
              'Produto Acabado'
              'Materia Prima'
              'Produto Consumo'
              'Autom'#225'tico')
            ItemIndex = 0
            TabOrder = 9
            IconItems = <>
          end
          object E_Qtde_Min: TUniEdit
            Left = 238
            Top = 107
            Width = 67
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 10
          end
          object UniLabel8: TUniLabel
            Left = 3
            Top = 178
            Width = 162
            Height = 14
            Hint = ''
            Caption = 'Localiza'#231#227'o / Endere'#231'o - Estoque'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 11
          end
          object E_Local: TUniEdit
            Left = 3
            Top = 193
            Width = 306
            Hint = ''
            Text = ''
            TabOrder = 12
            ReadOnly = True
          end
          object UniLabel9: TUniLabel
            Left = 3
            Top = 217
            Width = 46
            Height = 14
            Hint = ''
            Caption = 'Peso (kg)'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 13
          end
          object E_Peso: TUniEdit
            Left = 3
            Top = 232
            Width = 62
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 14
          end
          object UniLabel10: TUniLabel
            Left = 68
            Top = 217
            Width = 63
            Height = 14
            Hint = ''
            Caption = 'Largura (cm)'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 15
          end
          object E_Largura: TUniEdit
            Left = 66
            Top = 232
            Width = 76
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 16
          end
          object UniLabel11: TUniLabel
            Left = 144
            Top = 217
            Width = 87
            Height = 14
            Hint = ''
            Caption = 'Comprimento (cm)'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 17
          end
          object E_Comprimento: TUniEdit
            Left = 143
            Top = 232
            Width = 93
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 18
          end
          object l_height: TUniLabel
            Left = 238
            Top = 217
            Width = 54
            Height = 14
            Hint = ''
            Caption = 'Altura (cm)'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 19
          end
          object E_Altura: TUniEdit
            Left = 235
            Top = 232
            Width = 72
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 20
          end
          object dbg_StockList: TUniDBGrid
            Left = 314
            Top = 97
            Width = 303
            Height = 158
            Hint = ''
            HeaderTitle = 'Listas de Estoques'
            DataSource = Ds_stock_list
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick, dgTabs]
            LoadMask.Message = 'Loading data...'
            TabOrder = 21
            Columns = <
              item
                FieldName = 'id'
                Title.Caption = 'tb_merchandise_id'
                Width = 94
                Visible = False
                ReadOnly = True
              end
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o'
                Width = 183
                ReadOnly = True
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Saldo'
                Width = 70
                ReadOnly = True
              end>
          end
          object UniLabel12: TUniLabel
            Left = 3
            Top = 133
            Width = 154
            Height = 14
            Hint = ''
            Caption = 'Utilizar estoque por composi'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 22
          end
          object cb_comp: TUniComboBox
            Left = 3
            Top = 149
            Width = 302
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'N'#227'o Utilizar Esse Recuso'
              'Baixar Somente os Itens'
              'Produto Fabricado')
            TabOrder = 23
            IconItems = <>
          end
        end
      end
      inherited tb_Obs: TUniTabSheet
        ExplicitWidth = 624
        ExplicitHeight = 262
        inherited E_note: TUniMemo
          Width = 624
          Height = 105
          ExplicitWidth = 624
          ExplicitHeight = 105
        end
        inherited ChBx_highlights: TUniCheckBox
          Top = 125
          TabOrder = 2
          ExplicitTop = 125
        end
        inherited ChBx_active: TUniCheckBox
          Top = 140
          TabOrder = 3
          ExplicitTop = 140
        end
        inherited chbx_published: TUniCheckBox
          Top = 234
          Caption = 'Produto Publicado na Loja Virtual'
          TabOrder = 9
          ExplicitTop = 234
        end
        inherited chbx_promotion: TUniCheckBox
          Top = 109
          TabOrder = 1
          ExplicitTop = 109
        end
        object chbx_Imprime: TUniCheckBox
          Left = 4
          Top = 171
          Width = 438
          Height = 17
          Hint = ''
          Caption = 'N'#227'o Imprimir este Produto em Tabelas de Pre'#231'o'
          TabOrder = 5
        end
        object chbx_Serie: TUniCheckBox
          Left = 4
          Top = 202
          Width = 381
          Height = 17
          Hint = ''
          Caption = 'Controlar este produto por n'#250'mero de s'#233'rie'
          TabOrder = 7
        end
        object chbx_ForaLinha: TUniCheckBox
          Left = 4
          Top = 155
          Width = 236
          Height = 17
          Hint = ''
          Caption = 'Produto Fora de Linha'
          TabOrder = 4
        end
        object chbx_Exclusivo: TUniCheckBox
          Left = 4
          Top = 218
          Width = 381
          Height = 17
          Hint = ''
          Caption = 'Produto Exclusivo de Revenda. N'#227'o '#233' vendido para consumidor.'
          TabOrder = 8
        end
        object chbx_Ctrl_Estoque: TUniCheckBox
          Left = 4
          Top = 187
          Width = 446
          Height = 17
          Hint = ''
          Caption = 
            'N'#227'o controlar o estoque permitindo a movimenta'#231#227'o mesmo sem sald' +
            'o'
          TabOrder = 6
        end
      end
      object tbs_tributacao: TUniTabSheet
        Hint = ''
        Caption = 'Tributa'#231#227'o'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 624
          Height = 262
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel17: TUniLabel
            Left = 4
            Top = 3
            Width = 106
            Height = 14
            Hint = ''
            Caption = 'Origem da Mercadoria'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object Cb_OrigemMercadoria: TUniComboBox
            Left = 4
            Top = 19
            Width = 610
            Hint = ''
            Style = csDropDownList
            Text = '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8;'
            Items.Strings = (
              '0 - Nacional, exceto as indicadas nos c'#243'digos 3, 4, 5 e 8;'
              
                '1 - Estrangeira - Importa'#231#227'o direta, exceto a indicada no c'#243'digo' +
                ' 6;'
              
                '2 - Estrangeira - Adquirida no mercado interno, exceto a indicad' +
                'a no c'#243'digo 7;'
              
                '3 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                'ior a 40% e inferior ou igual a 70%;'
              
                '4 - Nacional, cuja prod. tenha sido feita em conf. os proc. prod' +
                'utivos b'#225'sicos conf as legisla'#231#245'es citadas nos Ajustes;'
              
                '5 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o infer' +
                'ior ou igual a 40%;'
              
                '6 - Estrangeira - Importa'#231#227'o direta, sem similar nacional,consta' +
                'nte em lista da CAMEX e g'#225's natural;'
              
                '7 - Estrangeira - Adquirida no mercado interno, sem similar naci' +
                'onal, constante lista CAMEX e g'#225's natural.'
              
                '8 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
                'ior a 70%;')
            ItemIndex = 0
            TabOrder = 2
            IconItems = <>
          end
          object Rg_ST: TUniRadioGroup
            Left = 4
            Top = 45
            Width = 145
            Height = 42
            Hint = ''
            Items.Strings = (
              'SIM'
              'N'#195'O')
            ItemIndex = 0
            Caption = 'Substitui'#231#227'o Tribut'#225'ria'
            TabOrder = 3
            Columns = 2
          end
          object Cb_Finalidade: TUniComboBox
            Left = 155
            Top = 60
            Width = 150
            Height = 23
            Hint = ''
            Style = csDropDownList
            Text = '1 - Revenda'
            Items.Strings = (
              '1 - Revenda'
              '2 - Produ'#231#227'o'
              '3 - Consignado'
              '4 - Industrializa'#231#227'o'
              '5 - Consumo Interno'
              '6 - Presta'#231#227'o de Servi'#231'o'
              '7 - Ativo Imobilizado')
            ItemIndex = 0
            TabOrder = 4
            IconItems = <>
          end
          object UniLabel18: TUniLabel
            Left = 155
            Top = 44
            Width = 127
            Height = 14
            Hint = ''
            Caption = 'Finalidade para Tributa'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
        end
      end
      object tbs_preco: TUniTabSheet
        Hint = ''
        Caption = 'Tabelas de Pre'#231'o'
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 624
          Height = 262
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel14: TUniLabel
            Left = 4
            Top = 3
            Width = 82
            Height = 14
            Hint = ''
            Caption = 'Custo de F'#225'brica'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_VL_Fabrica: TUniEdit
            Left = 3
            Top = 20
            Width = 100
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 2
          end
          object UniLabel15: TUniLabel
            Left = 109
            Top = 3
            Width = 52
            Height = 14
            Hint = ''
            Caption = 'Custo Real'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_VL_CustoReal: TUniEdit
            Left = 105
            Top = 20
            Width = 100
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 4
          end
          object UniLabel16: TUniLabel
            Left = 208
            Top = 3
            Width = 74
            Height = 14
            Hint = ''
            Caption = 'Pre'#231'o de Custo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object E_VL_Custo: TUniEdit
            Left = 206
            Top = 20
            Width = 100
            Hint = ''
            Alignment = taRightJustify
            Text = ''
            TabOrder = 6
          end
          object dbg_PriceList: TUniDBGrid
            Left = 2
            Top = 56
            Width = 620
            Height = 204
            Hint = ''
            HeaderTitle = 'Tabelas de Pre'#231'o'
            DataSource = Ds_price_list
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick, dgTabs]
            LoadMask.Message = 'Carregando Dados'
            Align = alBottom
            TabOrder = 7
            Columns = <
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o'
                Width = 274
                ReadOnly = True
                Sortable = True
              end
              item
                FieldName = 'aliq_kickback'
                Title.Caption = 'Margem'
                Width = 72
              end
              item
                FieldName = 'price_tag'
                Title.Caption = 'Valor de Venda'
                Width = 119
                Sortable = True
                DisplayMemo = True
              end
              item
                FieldName = 'aliq_profit'
                Title.Caption = 'Comiss'#227'o'
                Width = 71
              end
              item
                FieldName = 'quantity'
                Title.Caption = 'Qtde M'#237'nima'
                Width = 104
              end>
          end
          object UniHiddenPanel1: TUniHiddenPanel
            Left = 415
            Top = 90
            Width = 161
            Height = 131
            Hint = ''
            Visible = True
            object E_PriceTag: TUniFormattedNumberEdit
              Left = 24
              Top = 43
              Width = 121
              Hint = ''
              FormattedInput.ShowCurrencySign = True
              FormattedInput.CurrencySignPos = cpsLeft
              TabOrder = 2
              DecimalUseOSDefault = True
            end
            object E_Aliq_kickback: TUniNumberEdit
              Left = 24
              Top = 7
              Width = 121
              Hint = ''
              TabOrder = 1
              AllowBlank = False
              DecimalUseOSDefault = True
            end
          end
        end
      end
      object tbs_aplication: TUniTabSheet
        Hint = ''
        Caption = 'Aplica'#231#227'o'
        object E_aplication: TUniMemo
          Left = 0
          Top = 0
          Width = 624
          Height = 262
          Hint = ''
          Align = alClient
          TabOrder = 0
        end
      end
    end
    object UniLabel2: TUniLabel
      Left = 201
      Top = 6
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo Barras'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 13
    end
    object E_CodeBar: TUniEdit
      Left = 201
      Top = 21
      Width = 148
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object E_CodigoProvider: TUniEdit
      Left = 350
      Top = 21
      Width = 135
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object UniLabel3: TUniLabel
      Left = 350
      Top = 6
      Width = 92
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo Fornecedor'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 14
    end
    object UniLabel4: TUniLabel
      Left = 490
      Top = 6
      Width = 64
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo N.C.M'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 15
    end
    object E_CodigoNCM: TUniEdit
      Left = 487
      Top = 21
      Width = 111
      Hint = ''
      MaxLength = 8
      Text = ''
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 489
      Top = 44
      Width = 121
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo Especificador S.T'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 16
    end
    object E_codigoCEST: TUniEdit
      Left = 487
      Top = 59
      Width = 111
      Hint = ''
      MaxLength = 7
      Text = ''
      TabOrder = 6
      OnExit = E_codigoCESTExit
    end
    object Sb_ncm: TUniSpeedButton
      Left = 600
      Top = 20
      Width = 23
      Height = 22
      Hint = ''
      Caption = '...'
      ParentColor = False
      Color = clWindow
      TabOrder = 17
      OnClick = Sb_ncmClick
    end
    object Sb_CEST: TUniSpeedButton
      Left = 600
      Top = 59
      Width = 23
      Height = 22
      Hint = ''
      Caption = '...'
      ParentColor = False
      Color = clWindow
      TabOrder = 18
      OnClick = Sb_CESTClick
    end
  end
  inherited ds_msg: TDataSource
    Left = 120
    Top = 96
  end
  inherited MenuTask: TUniMainMenu
    Left = 192
    Top = 40
    inherited MnuTarefas: TUniMenuItem
      object Composio1: TUniMenuItem
        Caption = 'Composi'#231#227'o'
        OnClick = Composio1Click
      end
    end
  end
  object cds_price_list: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'tb_price_list_id;description;price_tag'
    FetchOnDemand = False
    Params = <>
    OnCalcFields = cds_price_listCalcFields
    Left = 27
    Top = 224
    object cds_price_listtb_price_list_id: TIntegerField
      FieldName = 'tb_price_list_id'
      KeyFields = 'tb_price_list_id'
      Origin = 'tb_price_list_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_price_listdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      Required = True
      Size = 45
    end
    object cds_price_listprice_tag: TFMTBCDField
      FieldName = 'price_tag'
      Origin = 'price_tag'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 6
    end
    object cds_price_listaliq_profit: TBCDField
      FieldName = 'aliq_profit'
      Origin = 'aliq_profit'
      DisplayFormat = '0.00 %'
      Precision = 10
      Size = 3
    end
    object cds_price_listaliq_kickback: TBCDField
      FieldName = 'aliq_kickback'
      Origin = 'aliq_kickback'
      DisplayFormat = '0.00 %'
      Precision = 10
      Size = 2
    end
    object cds_price_listquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 3
    end
    object cds_price_listregister: TStringField
      FieldKind = fkCalculated
      FieldName = 'reg_status'
      Calculated = True
    end
  end
  object Ds_price_list: TDataSource
    DataSet = cds_price_list
    Left = 27
    Top = 275
  end
  object cds_stock_list: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    Left = 376
    Top = 280
    object cds_stock_listtb_institution_id: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_stock_listdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      Size = 45
    end
    object cds_stock_listquantity: TBCDField
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 10
    end
    object cds_stock_listtb_product_id: TIntegerField
      FieldName = 'tb_product_id'
    end
    object cds_stock_listreg_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'reg_status'
      Calculated = True
    end
  end
  object Ds_stock_list: TDataSource
    DataSet = cds_stock_list
    Left = 376
    Top = 331
  end
end
