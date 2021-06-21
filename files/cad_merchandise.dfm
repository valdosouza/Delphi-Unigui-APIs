inherited CadMerchandise: TCadMerchandise
  ClientHeight = 574
  ClientWidth = 680
  Caption = 'Cadastro de Mercadoria'
  ExplicitWidth = 696
  ExplicitHeight = 633
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 510
    Width = 680
    ExplicitTop = 510
    ExplicitWidth = 680
  end
  inherited pnl_fundo: TUniPanel
    Width = 680
    Height = 510
    ExplicitWidth = 680
    ExplicitHeight = 510
    object ctn_Category: TUniContainerPanel
      AlignWithMargins = True
      Left = 4
      Top = 106
      Width = 672
      Height = 52
      Hint = ''
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 1
    end
    object pnl_linha_1: TUniPanel
      Left = 2
      Top = 2
      Width = 676
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object E_ID: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 56
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Text = ''
        Align = alLeft
        TabOrder = 1
        TabStop = False
        ReadOnly = True
        FieldLabel = 'C'#243'digo'
        FieldLabelAlign = laTop
      end
      object E_Identifier: TUniEdit
        AlignWithMargins = True
        Left = 65
        Top = 3
        Width = 135
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        CharEOL = #13
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'C'#243'd. F'#225'brica/Montadora'
        FieldLabelAlign = laTop
        OnExit = E_IdentifierExit
      end
      object E_CodeBar: TUniEdit
        AlignWithMargins = True
        Left = 206
        Top = 3
        Width = 165
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Text = ''
        Align = alLeft
        TabOrder = 3
        FieldLabel = 'C'#243'digo Barras'
        FieldLabelAlign = laTop
        OnExit = E_CodeBarExit
      end
      object E_CodigoProvider: TUniEdit
        AlignWithMargins = True
        Left = 377
        Top = 3
        Width = 135
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        Text = ''
        Align = alLeft
        TabOrder = 4
        FieldLabel = 'C'#243'digo Fornecedor'
        FieldLabelAlign = laTop
      end
      object E_CodigoNCM: TUniEdit
        AlignWithMargins = True
        Left = 518
        Top = 3
        Width = 115
        Height = 41
        Hint = ''
        Margins.Bottom = 8
        MaxLength = 8
        Text = ''
        Align = alLeft
        TabOrder = 5
        FieldLabel = 'C'#243'digo N.C.M'
        FieldLabelAlign = laTop
      end
      object Sb_ncm: TUniSpeedButton
        AlignWithMargins = True
        Left = 639
        Top = 22
        Width = 23
        Height = 27
        Hint = ''
        Margins.Top = 22
        Caption = '...'
        Align = alLeft
        ParentColor = False
        Color = clWindow
        TabOrder = 6
        OnClick = Sb_ncmClick
      end
    end
    object pnl_linha_2: TUniPanel
      Left = 2
      Top = 54
      Width = 676
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 509
        Height = 46
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Align = alLeft
        TabOrder = 1
        FieldLabel = 'Descri'#231#227'o'
        FieldLabelAlign = laTop
      end
      object E_codigoCEST: TUniEdit
        AlignWithMargins = True
        Left = 518
        Top = 3
        Width = 120
        Height = 46
        Hint = ''
        MaxLength = 7
        Text = ''
        Align = alLeft
        TabOrder = 2
        FieldLabel = 'C'#243'd Esp S.T'
        FieldLabelAlign = laTop
      end
      object Sb_CEST: TUniSpeedButton
        AlignWithMargins = True
        Left = 644
        Top = 22
        Width = 23
        Height = 27
        Hint = ''
        Margins.Top = 22
        Caption = '...'
        Align = alLeft
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = Sb_CESTClick
      end
    end
    object Pg_Main: TUniPageControl
      Left = 2
      Top = 158
      Width = 676
      Height = 350
      Hint = ''
      ActivePage = tbs_estoque
      Align = alClient
      TabOrder = 4
      object tbs_estoque: TUniTabSheet
        Hint = ''
        Caption = 'Estoque'
        object pnl_estoque_linha_3: TUniPanel
          Left = 0
          Top = 104
          Width = 668
          Height = 218
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object dbg_StockList: TUniDBGrid
            AlignWithMargins = True
            Left = 332
            Top = 5
            Width = 331
            Height = 208
            Hint = ''
            HeaderTitle = 'Listas de Estoques'
            DataSource = Ds_stock_list
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick, dgTabs]
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
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
          object pnl_estoque_linha_3_left: TUniPanel
            Left = 2
            Top = 2
            Width = 327
            Height = 214
            Hint = ''
            Align = alLeft
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object pnl_estoque_linha_3_1_left: TUniPanel
              Left = 0
              Top = 0
              Width = 327
              Height = 52
              Hint = ''
              Align = alTop
              TabOrder = 1
              BorderStyle = ubsNone
              Caption = ''
              object E_Qtde_Min: TUniEdit
                AlignWithMargins = True
                Left = 239
                Top = 3
                Width = 85
                Height = 46
                Hint = ''
                Alignment = taRightJustify
                Text = ''
                Align = alClient
                TabOrder = 1
                FieldLabel = 'Qtde. M'#237'nimo'
                FieldLabelAlign = laTop
              end
              object Cb_kind: TUniComboBox
                AlignWithMargins = True
                Left = 80
                Top = 3
                Width = 153
                Height = 46
                Hint = ''
                Style = csDropDownList
                Text = 'Produto Acabado'
                Items.Strings = (
                  'Produto Acabado'
                  'Materia Prima'
                  'Produto Consumo'
                  'Autom'#225'tico')
                ItemIndex = 0
                Align = alLeft
                TabOrder = 2
                FieldLabel = 'Tipo do Mercadoria'
                FieldLabelAlign = laTop
                IconItems = <>
              end
              object E_Divisor: TUniEdit
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 71
                Height = 46
                Hint = ''
                Alignment = taRightJustify
                Text = '1'
                Align = alLeft
                TabOrder = 3
                FieldLabel = 'Divisor'
                FieldLabelAlign = laTop
              end
            end
            object pnl_estoque_linha_3_4_left: TUniPanel
              Left = 0
              Top = 156
              Width = 327
              Height = 52
              Hint = ''
              Align = alTop
              TabOrder = 2
              BorderStyle = ubsNone
              Caption = ''
              object E_Peso: TUniEdit
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 62
                Height = 46
                Hint = ''
                Alignment = taRightJustify
                Text = ''
                Align = alLeft
                TabOrder = 1
                FieldLabel = 'Peso (kg)'
                FieldLabelAlign = laTop
              end
              object E_Largura: TUniEdit
                AlignWithMargins = True
                Left = 71
                Top = 3
                Width = 76
                Height = 46
                Hint = ''
                Alignment = taRightJustify
                Text = ''
                Align = alLeft
                TabOrder = 2
                FieldLabel = 'Largura (cm)'
                FieldLabelAlign = laTop
              end
              object E_Comprimento: TUniEdit
                AlignWithMargins = True
                Left = 153
                Top = 3
                Width = 93
                Height = 46
                Hint = ''
                Alignment = taRightJustify
                Text = ''
                Align = alLeft
                TabOrder = 3
                FieldLabel = 'Comprim. (cm)'
                FieldLabelAlign = laTop
              end
              object E_Altura: TUniEdit
                AlignWithMargins = True
                Left = 252
                Top = 3
                Width = 72
                Height = 46
                Hint = ''
                Alignment = taRightJustify
                Text = ''
                Align = alLeft
                TabOrder = 4
                FieldLabel = 'Altura (cm)'
                FieldLabelAlign = laTop
              end
            end
            object pnl_estoque_linha_3_3_left: TUniPanel
              Left = 0
              Top = 104
              Width = 327
              Height = 52
              Hint = ''
              Align = alTop
              TabOrder = 3
              BorderStyle = ubsNone
              Caption = ''
              object E_Local: TUniEdit
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 321
                Height = 46
                Hint = ''
                Text = ''
                Align = alClient
                TabOrder = 1
                ReadOnly = True
                FieldLabel = 'Localiza'#231#227'o / Endere'#231'o - Estoque'
                FieldLabelAlign = laTop
              end
            end
            object pnl_estoque_linha_3_2_left: TUniPanel
              Left = 0
              Top = 52
              Width = 327
              Height = 52
              Hint = ''
              Align = alTop
              TabOrder = 4
              BorderStyle = ubsNone
              Caption = ''
              object cb_comp: TUniComboBox
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 321
                Height = 46
                Hint = ''
                Style = csDropDownList
                Text = ''
                Items.Strings = (
                  'N'#227'o Utilizar Esse Recuso'
                  'Baixar Somente os Itens'
                  'Produto Fabricado')
                Align = alClient
                TabOrder = 1
                FieldLabel = 'Utilizar estoque por composi'#231#227'o'
                FieldLabelAlign = laTop
                IconItems = <>
              end
            end
          end
        end
        object pnl_estoque_linha_1: TUniPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 52
          Hint = ''
          Align = alTop
          TabOrder = 1
          BorderStyle = ubsNone
          Caption = ''
          object ctn_Brand: TUniContainerPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 325
            Height = 50
            Hint = ''
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            ParentColor = False
            Align = alLeft
            TabOrder = 1
          end
          object ctn_Measure: TUniContainerPanel
            AlignWithMargins = True
            Left = 328
            Top = 1
            Width = 339
            Height = 50
            Hint = ''
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            ParentColor = False
            Align = alClient
            TabOrder = 2
          end
        end
        object pnl_estoque_linha_2: TUniPanel
          Left = 0
          Top = 52
          Width = 668
          Height = 52
          Hint = ''
          Align = alTop
          TabOrder = 2
          BorderStyle = ubsNone
          Caption = ''
          object ctn_package: TUniContainerPanel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 325
            Height = 50
            Hint = ''
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            ParentColor = False
            Align = alLeft
            TabOrder = 1
          end
          object ctn_color: TUniContainerPanel
            AlignWithMargins = True
            Left = 328
            Top = 1
            Width = 339
            Height = 50
            Hint = ''
            Margins.Left = 1
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            ParentColor = False
            Align = alClient
            TabOrder = 2
          end
        end
      end
      object tb_Obs: TUniTabSheet
        Hint = ''
        Caption = 'Observa'#231#227'o'
        object E_note: TUniMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 662
          Height = 105
          Hint = ''
          Align = alTop
          TabOrder = 0
        end
        object ChBx_highlights: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 130
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Produto em Destaque'
          Align = alTop
          TabOrder = 2
        end
        object ChBx_active: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 147
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Produto encontra-se ativo para qualquer transa'#231#227'o'
          Align = alTop
          TabOrder = 3
        end
        object chbx_published: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 249
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Produto Publicado na Loja Virtual'
          Align = alTop
          TabOrder = 9
        end
        object chbx_promotion: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 113
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 2
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Produto em Promo'#231#227'o'
          Align = alTop
          TabOrder = 1
        end
        object chbx_Imprime: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 181
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'N'#227'o Imprimir este Produto em Tabelas de Pre'#231'o'
          Align = alTop
          TabOrder = 5
        end
        object chbx_Serie: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 215
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Controlar este produto por n'#250'mero de s'#233'rie'
          Align = alTop
          TabOrder = 7
        end
        object chbx_ForaLinha: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 164
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Produto Fora de Linha'
          Align = alTop
          TabOrder = 4
        end
        object chbx_Exclusivo: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 232
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Produto Exclusivo de Revenda. N'#227'o '#233' vendido para consumidor.'
          Align = alTop
          TabOrder = 8
        end
        object chbx_Ctrl_Estoque: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 198
          Width = 665
          Height = 17
          Hint = ''
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 
            'N'#227'o controlar o estoque permitindo a movimenta'#231#227'o mesmo sem sald' +
            'o'
          Align = alTop
          TabOrder = 6
        end
      end
      object tbs_tributacao: TUniTabSheet
        Hint = ''
        Caption = 'Tributa'#231#227'o'
        object pnl_tributacao: TUniPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 322
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object pnl_tributacao_linha_2: TUniPanel
            Left = 2
            Top = 54
            Width = 664
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object Rg_ST: TUniRadioGroup
              AlignWithMargins = True
              Left = 159
              Top = 3
              Width = 145
              Height = 46
              Hint = ''
              Items.Strings = (
                'SIM'
                'N'#195'O')
              ItemIndex = 0
              Align = alLeft
              Caption = 'Substitui'#231#227'o Tribut'#225'ria'
              TabOrder = 1
              Columns = 2
            end
            object Cb_Finalidade: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 150
              Height = 46
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
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Finalidade para Tributa'#231#227'o'
              FieldLabelAlign = laTop
              IconItems = <>
            end
          end
          object pnl_tributacao_linha_1: TUniPanel
            Left = 2
            Top = 2
            Width = 664
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object Cb_OrigemMercadoria: TUniComboBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 658
              Height = 46
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
              Align = alClient
              TabOrder = 1
              FieldLabel = 'Origem da Mercadoria'
              FieldLabelAlign = laTop
              IconItems = <>
            end
          end
        end
      end
      object tbs_preco: TUniTabSheet
        Hint = ''
        Caption = 'Tabelas de Pre'#231'o'
        object pnl_price_list: TUniPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 322
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object dbg_PriceList: TUniDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 57
            Width = 658
            Height = 260
            Hint = ''
            ClicksToEdit = 1
            HeaderTitle = 'Tabelas de Pre'#231'o'
            DataSource = Ds_price_list
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick, dgTabs, dgAutoRefreshRow]
            LoadMask.Message = 'Carregando Dados'
            Align = alClient
            TabOrder = 1
            OnCellClick = dbg_PriceListCellClick
            Columns = <
              item
                FieldName = 'description'
                Title.Caption = 'Descri'#231#227'o'
                Width = 274
                ReadOnly = True
                Sortable = True
              end
              item
                FieldName = 'aliq_profit'
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
                FieldName = 'aliq_kickback'
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
          object pnl_price_linha_1: TUniPanel
            Left = 2
            Top = 2
            Width = 664
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            object E_VL_Fabrica: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 100
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Custo de F'#225'brica'
              FieldLabelAlign = laTop
              OnExit = E_VL_FabricaExit
            end
            object E_VL_CustoReal: TUniEdit
              AlignWithMargins = True
              Left = 109
              Top = 3
              Width = 100
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Custo Real'
              FieldLabelAlign = laTop
              OnExit = E_VL_CustoRealExit
            end
            object E_VL_Custo: TUniEdit
              AlignWithMargins = True
              Left = 215
              Top = 3
              Width = 100
              Height = 46
              Hint = ''
              Alignment = taRightJustify
              Text = ''
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'Pre'#231'o de Custo'
              FieldLabelAlign = laTop
              OnExit = E_VL_CustoExit
            end
          end
        end
      end
      object tbs_aplication: TUniTabSheet
        Hint = ''
        Caption = 'Aplica'#231#227'o'
        object E_aplication: TUniMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 662
          Height = 316
          Hint = ''
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 200
    Top = 64
  end
  inherited ds_msg: TDataSource
    Left = 192
  end
  inherited MenuTask: TUniMainMenu
    Left = 48
    Top = 120
    inherited MnuTarefas: TUniMenuItem
      object Configurao1: TUniMenuItem
        Caption = 'Configura'#231#231#227'o'
        OnClick = Configurao1Click
      end
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
    Left = 419
    Top = 72
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
    object cds_price_listtb_product_id: TIntegerField
      FieldName = 'tb_product_id'
    end
  end
  object Ds_price_list: TDataSource
    AutoEdit = False
    DataSet = cds_price_list
    Left = 419
    Top = 123
  end
  object cds_stock_list: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    Left = 536
    Top = 72
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
    AutoEdit = False
    DataSet = cds_stock_list
    Left = 536
    Top = 123
  end
  object ACBrValidador: TACBrValidador
    IgnorarChar = './-'
    Left = 320
    Top = 80
  end
end
