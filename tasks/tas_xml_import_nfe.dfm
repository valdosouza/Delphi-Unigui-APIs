inherited TasXmlImportNfe: TTasXmlImportNfe
  ClientHeight = 547
  ClientWidth = 929
  Caption = 'Importa'#231#227'o do XML da Nota Fiscal'
  ExplicitWidth = 945
  ExplicitHeight = 606
  PixelsPerInch = 96
  TextHeight = 13
  object pg_geral: TUniPageControl [0]
    Left = 0
    Top = 81
    Width = 929
    Height = 400
    Hint = ''
    ActivePage = tbs_Items
    Align = alClient
    TabOrder = 0
    OnChange = pg_geralChange
    ExplicitWidth = 785
    ExplicitHeight = 362
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Dados da Nota'
      object UniPageControl2: TUniPageControl
        Left = 0
        Top = 219
        Width = 921
        Height = 153
        Hint = ''
        ActivePage = UniTabSheet3
        Align = alBottom
        TabOrder = 0
        object UniTabSheet3: TUniTabSheet
          Hint = ''
          Caption = 'Totalizador'
          object UniPanel2: TUniPanel
            Left = 0
            Top = 0
            Width = 913
            Height = 125
            Hint = ''
            Align = alClient
            TabOrder = 0
            BorderStyle = ubsFrameLowered
            Caption = ''
            object UniLabel23: TUniLabel
              Left = 5
              Top = 4
              Width = 120
              Height = 14
              Hint = ''
              Caption = 'Base do C'#225'lculo do ICMS'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 18
            end
            object E_BC_ICMS: TUniEdit
              Left = 4
              Top = 20
              Width = 154
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 0
              ReadOnly = True
            end
            object E_VL_ICMS: TUniEdit
              Left = 160
              Top = 20
              Width = 154
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 1
              ReadOnly = True
            end
            object UniLabel24: TUniLabel
              Left = 168
              Top = 4
              Width = 52
              Height = 14
              Hint = ''
              Caption = 'Valor ICMS'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 19
            end
            object E_BC_ICMS_ST: TUniEdit
              Left = 315
              Top = 20
              Width = 145
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 2
              ReadOnly = True
            end
            object UniLabel25: TUniLabel
              Left = 326
              Top = 4
              Width = 124
              Height = 14
              Hint = ''
              Caption = 'Base Calculo ICMS Subst.'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 20
            end
            object E_VL_ICMS_ST: TUniEdit
              Left = 461
              Top = 20
              Width = 154
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 3
              ReadOnly = True
            end
            object UniLabel26: TUniLabel
              Left = 476
              Top = 4
              Width = 114
              Height = 14
              Hint = ''
              Caption = 'Valor ICMS Substitui'#231#227'o'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 21
            end
            object UniLabel27: TUniLabel
              Left = 636
              Top = 4
              Width = 117
              Height = 14
              Hint = ''
              Caption = 'Valor Total dos Produtos'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 22
            end
            object E_Vl_Product: TUniEdit
              Left = 616
              Top = 20
              Width = 146
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 4
              ReadOnly = True
            end
            object UniLabel28: TUniLabel
              Left = 4
              Top = 45
              Width = 68
              Height = 14
              Hint = ''
              Caption = 'Valor do Frete'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 23
            end
            object E_Vl_freight: TUniEdit
              Left = 4
              Top = 60
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 5
              ReadOnly = True
            end
            object E_Vl_Assurance: TUniEdit
              Left = 130
              Top = 60
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 6
              ReadOnly = True
            end
            object UniLabel29: TUniLabel
              Left = 129
              Top = 45
              Width = 78
              Height = 14
              Hint = ''
              Caption = 'Valor do Seguro'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 24
            end
            object UniLabel30: TUniLabel
              Left = 254
              Top = 45
              Width = 143
              Height = 14
              Hint = ''
              Caption = 'Outras Despesas Acess'#243'rias'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 25
            end
            object E_VL_Expenses: TUniEdit
              Left = 256
              Top = 60
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 7
              ReadOnly = True
            end
            object E_VL_IPI: TUniEdit
              Left = 383
              Top = 60
              Width = 127
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 8
              ReadOnly = True
            end
            object UniLabel31: TUniLabel
              Left = 404
              Top = 45
              Width = 53
              Height = 14
              Hint = ''
              Caption = 'Valor da IPI'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 26
            end
            object E_VL_Discount: TUniEdit
              Left = 511
              Top = 60
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 9
              ReadOnly = True
            end
            object UniLabel32: TUniLabel
              Left = 511
              Top = 45
              Width = 74
              Height = 14
              Hint = ''
              Caption = 'Valor Desconto'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 27
            end
            object UniLabel33: TUniLabel
              Left = 637
              Top = 48
              Width = 90
              Height = 14
              Hint = ''
              Caption = 'Valor Total da Nota'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 28
            end
            object E_Vl_Invoice: TUniEdit
              Left = 637
              Top = 60
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Alignment = taRightJustify
              Text = ''
              ParentFont = False
              TabOrder = 10
              ReadOnly = True
            end
            object UniLabel20: TUniLabel
              Left = 6
              Top = 85
              Width = 55
              Height = 14
              Hint = ''
              Caption = 'Quantidade'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 29
            end
            object E_Amount: TUniEdit
              Left = 5
              Top = 100
              Width = 80
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              TabOrder = 11
            end
            object UniLabel35: TUniLabel
              Left = 89
              Top = 85
              Width = 38
              Height = 14
              Hint = ''
              Caption = 'Esp'#233'cie'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 30
            end
            object E_Kind: TUniEdit
              Left = 86
              Top = 100
              Width = 107
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              TabOrder = 12
            end
            object UniLabel36: TUniLabel
              Left = 200
              Top = 85
              Width = 30
              Height = 14
              Hint = ''
              Caption = 'Marca'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 31
            end
            object E_Brand: TUniEdit
              Left = 195
              Top = 100
              Width = 209
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              TabOrder = 13
            end
            object E_Number: TUniEdit
              Left = 405
              Top = 100
              Width = 104
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              TabOrder = 14
            end
            object UniLabel37: TUniLabel
              Left = 408
              Top = 85
              Width = 37
              Height = 14
              Hint = ''
              Caption = 'N'#250'mero'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 32
            end
            object E_Gross_Weight: TUniEdit
              Left = 511
              Top = 100
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              TabOrder = 15
            end
            object UniLabel38: TUniLabel
              Left = 518
              Top = 85
              Width = 53
              Height = 14
              Hint = ''
              Caption = 'Peso Bruto'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 33
            end
            object UniLabel39: TUniLabel
              Left = 648
              Top = 85
              Width = 61
              Height = 14
              Hint = ''
              Caption = 'Peso L'#237'quido'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 34
            end
            object E_Net_Weight: TUniEdit
              Left = 637
              Top = 100
              Width = 125
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              TabOrder = 16
            end
          end
        end
        object UniTabSheet4: TUniTabSheet
          Hint = ''
          Caption = 'Observa'#231#227'o'
          object M_Note: TUniMemo
            Left = 0
            Top = 0
            Width = 913
            Height = 125
            Hint = ''
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 921
        Height = 219
        Hint = ''
        Align = alClient
        TabOrder = 1
        BorderStyle = ubsFrameLowered
        Caption = ''
        object UniLabel9: TUniLabel
          Left = 12
          Top = 3
          Width = 110
          Height = 14
          Hint = ''
          Caption = 'Natureza da Opera'#231#227'o'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 3
        end
        object E_Cfop: TUniEdit
          Left = 9
          Top = 18
          Width = 486
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          TabOrder = 0
        end
        object E_Invoice: TUniEdit
          Left = 497
          Top = 18
          Width = 128
          Hint = ''
          CharCase = ecUpperCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          TabOrder = 1
        end
        object UniLabel10: TUniLabel
          Left = 497
          Top = 3
          Width = 68
          Height = 14
          Hint = ''
          Caption = 'Nota Fiscal N'#186
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 4
        end
        object UniGroupBox2: TUniGroupBox
          Left = 2
          Top = 43
          Width = 620
          Height = 132
          Hint = ''
          Caption = 'Destinat'#225'rio/Remetente'
          TabOrder = 5
          object UniLabel7: TUniLabel
            Left = 6
            Top = 13
            Width = 62
            Height = 14
            Hint = ''
            Caption = 'Raz'#227'o social'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 10
          end
          object E_company: TUniEdit
            Left = 6
            Top = 28
            Width = 427
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 0
          end
          object UniLabel8: TUniLabel
            Left = 6
            Top = 49
            Width = 46
            Height = 14
            Hint = ''
            Caption = 'Endere'#231'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 11
          end
          object E_Street: TUniEdit
            Left = 6
            Top = 64
            Width = 271
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object l_city: TUniLabel
            Left = 6
            Top = 86
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'Cidade'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 12
          end
          object E_City: TUniEdit
            Left = 3
            Top = 103
            Width = 277
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 5
          end
          object UniLabel13: TUniLabel
            Left = 283
            Top = 86
            Width = 24
            Height = 14
            Hint = ''
            Caption = 'Fone'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 13
          end
          object E_Phone: TUniEdit
            Left = 283
            Top = 103
            Width = 113
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 6
          end
          object UniLabel14: TUniLabel
            Left = 283
            Top = 49
            Width = 29
            Height = 14
            Hint = ''
            Caption = 'Bairro'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 14
          end
          object E_Neighborhood: TUniEdit
            Left = 283
            Top = 64
            Width = 217
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object UniLabel17: TUniLabel
            Left = 399
            Top = 86
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'Estado'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 15
          end
          object E_State: TUniEdit
            Left = 399
            Top = 103
            Width = 42
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 7
          end
          object UniLabel18: TUniLabel
            Left = 444
            Top = 86
            Width = 88
            Height = 14
            Hint = ''
            Caption = 'Inscri'#231#227'o Estadual'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 16
          end
          object E_IE: TUniEdit
            Left = 444
            Top = 103
            Width = 168
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 8
          end
          object UniLabel19: TUniLabel
            Left = 506
            Top = 49
            Width = 19
            Height = 14
            Hint = ''
            Caption = 'CEP'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 17
          end
          object E_ZipCode: TUniEdit
            Left = 506
            Top = 64
            Width = 105
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
          object UniLabel21: TUniLabel
            Left = 439
            Top = 13
            Width = 60
            Height = 14
            Hint = ''
            Caption = 'C.N.P.J/C.P.F'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 18
          end
          object E_Cnpj_Cpf: TUniEdit
            Left = 438
            Top = 28
            Width = 170
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
        end
        object UniGroupBox3: TUniGroupBox
          Left = 625
          Top = 43
          Width = 147
          Height = 132
          Hint = ''
          Caption = 'Destinat'#225'rio/Remetente'
          TabOrder = 6
          object UniLabel15: TUniLabel
            Left = 7
            Top = 13
            Width = 80
            Height = 14
            Hint = ''
            Caption = 'Data de Emiss'#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_DT_Emission: TUniEdit
            Left = 7
            Top = 28
            Width = 132
            Hint = ''
            CharCase = ecUpperCase
            Alignment = taCenter
            Text = ''
            ParentFont = False
            TabOrder = 0
          end
          object UniLabel16: TUniLabel
            Left = 8
            Top = 56
            Width = 67
            Height = 14
            Hint = ''
            Caption = 'Data de Sa'#237'da'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 4
          end
          object E_DT_Exit: TUniEdit
            Left = 7
            Top = 71
            Width = 132
            Hint = ''
            CharCase = ecUpperCase
            Alignment = taCenter
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object tbs_Items: TUniTabSheet
      Hint = ''
      Caption = 'Itens da Nota'
      object UniCheckBox1: TUniCheckBox
        Left = 8
        Top = -48
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'UniCheckBox1'
        TabOrder = 0
      end
      object pnl_itens: TUniPanel
        Left = 0
        Top = 0
        Width = 921
        Height = 372
        Hint = ''
        Align = alClient
        TabOrder = 1
        BorderStyle = ubsFrameLowered
        Caption = 'pnl_itens'
        ExplicitWidth = 777
        ExplicitHeight = 334
        DesignSize = (
          921
          372)
        object Dbg_Itens: TUniDBGrid
          Left = 2
          Top = 2
          Width = 917
          Height = 332
          Hint = ''
          ClicksToEdit = 1
          DataSource = ds_nfeItems
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgTitleClick]
          LoadMask.WaitData = True
          LoadMask.Message = 'Carregando dados....'
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          OnFieldImage = Dbg_ItensFieldImage
          OnSetCellValue = Dbg_ItensSetCellValue
          Columns = <
            item
              FieldName = 'conferido'
              Title.Caption = 'conferido'
              Width = 124
              ReadOnly = True
              ImageOptions.Visible = True
              ImageOptions.Width = 16
              ImageOptions.Height = 16
            end
            item
              FieldName = 'nfeNrITem'
              Title.Caption = 'Item'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'nfeProduct'
              Title.Caption = 'Descri'#231#227'o do Produto/Servi'#231'o'
              Width = 336
              ReadOnly = True
            end
            item
              FieldName = 'nfeUnidade'
              Title.Caption = 'Unidade'
              Width = 70
              ReadOnly = True
            end
            item
              FieldName = 'nfeQtde'
              Title.Caption = 'Qtde'
              Width = 68
            end
            item
              FieldName = 'nfeUnitValue'
              Title.Caption = 'Valor Unit'#225'rio'
              Width = 89
            end
            item
              FieldName = 'nfeTotalValue'
              Title.Caption = 'Valor Total'
              Width = 81
              ReadOnly = True
            end
            item
              FieldName = 'nfeDiscountValue'
              Title.Caption = 'Valor Desconto'
              Width = 79
              ReadOnly = True
            end
            item
              FieldName = 'nfeIdProduct'
              Title.Caption = 'C'#243'digo Nota'
              Width = 154
              ReadOnly = True
            end
            item
              FieldName = 'nfeBarCode'
              Title.Caption = 'C'#243'digo Barras'
              Width = 99
              ReadOnly = True
            end
            item
              FieldName = 'IntIdProduct'
              Title.Caption = 'C'#243'digo Interno'
              Width = 76
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'intProduct'
              Title.Caption = 'Descri'#231#227'o Produto Interno'
              Width = 305
              Editor = Dblcb_Hdd_List_Merchandise
            end
            item
              FieldName = 'intIdStock'
              Title.Caption = 'C'#243'dgo Estoque'
              Width = 77
              Visible = False
              ReadOnly = True
              Editor = Dblcb_Hdd_List_Stock
            end
            item
              FieldName = 'intStock'
              Title.Caption = 'Estoque/Obra'
              Width = 262
              Editor = Dblcb_Hdd_List_Stock
            end
            item
              FieldName = 'nfeNCM'
              Title.Caption = 'NCM'
              Width = 52
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'nfeOrigin'
              Title.Caption = 'Origem'
              Width = 38
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'nfeSubTrib'
              Title.Caption = 'Sub. trib'
              Width = 45
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'duplicate'
              Title.Caption = 'duplicate'
              Width = 47
              Visible = False
              ReadOnly = True
            end
            item
              FieldName = 'OrderPuchase'
              Title.Caption = 'Pedido de Compra'
              Width = 105
            end>
        end
        object UniHiddenPanel1: TUniHiddenPanel
          Left = 497
          Top = 46
          Width = 249
          Height = 187
          Hint = ''
          Visible = True
          object Dblcb_Hdd_List_Merchandise: TUniDBLookupComboBox
            Left = 3
            Top = 18
            Width = 145
            Hint = ''
            ListFormat = '%s - %s'
            ListField = 'id;description'
            ListSource = ds_merchandise
            KeyField = 'description'
            ListFieldIndex = 0
            AnyMatch = True
            TabOrder = 1
            Color = clWindow
            MinQueryLength = 3
            Style = csDropDown
            OnMouseDown = Dblcb_Hdd_List_MerchandiseMouseDown
          end
          object UniLabel2: TUniLabel
            Left = 5
            Top = 3
            Width = 82
            Height = 14
            Hint = ''
            Caption = 'Nome do Produto'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            ParentColor = False
            Color = clWindow
            TabOrder = 2
          end
          object Dblcb_Hdd_List_Stock: TUniDBLookupComboBox
            Left = 3
            Top = 46
            Width = 145
            Hint = ''
            ListFormat = '%s - %s'
            ListField = 'id;description'
            ListSource = ds_stock
            KeyField = 'description'
            ListFieldIndex = 0
            AnyMatch = True
            TabOrder = 3
            Color = clWindow
            Style = csDropDown
          end
        end
        object sb_reload_Items: TUniSpeedButton
          Left = 4
          Top = 335
          Width = 127
          Height = 31
          Hint = ''
          Caption = 'Recarregar Lista'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 3
          OnClick = sb_reload_ItemsClick
        end
        object sb_duplica_Item: TUniSpeedButton
          Left = 131
          Top = 335
          Width = 127
          Height = 31
          Hint = ''
          Caption = 'Duplicar Item'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 4
          OnClick = sb_duplica_ItemClick
        end
        object img_ok: TUniImage
          Left = 22
          Top = 27
          Width = 16
          Height = 16
          Hint = ''
          Visible = False
          AutoSize = True
          Picture.Data = {
            0A544A504547496D616765F3020000FFD8FFE000104A46494600010100000100
            010000FFFE003E43524541544F523A2067642D6A7065672076312E3020287573
            696E6720494A47204A50454720763830292C2064656661756C74207175616C69
            74790AFFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC00011080010001003012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7E2
            428249C01C926B2ADD1F53BC178E596DE26FDCA74DC47F11A82E22B83A94D651
            9221B922466FEEAFF156DA22C71AA2001546001D85629FB47AECBF323E27E87F
            FFD9}
          Anchors = []
        end
        object img_not_ok: TUniImage
          Left = 22
          Top = 48
          Width = 16
          Height = 16
          Hint = ''
          Visible = False
          AutoSize = True
          Picture.Data = {
            0A544A504547496D61676528030000FFD8FFE000104A46494600010100000100
            010000FFFE003E43524541544F523A2067642D6A7065672076312E3020287573
            696E6720494A47204A50454720763830292C2064656661756C74207175616C69
            74790AFFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC00011080010001003012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7D7
            758D19DD82AA8C9627000AE3F4C867F166B6BAE5C3CB1E9769262C2104AF9841
            E643ED9FF0EDCE6EA765A9B78AAFB40B52E2CB5564B9965E7F7718CF9807D4F1
            F90EF5E816F6F15ADB476F02048A25088A3A003A572A6EB4ACD5945FDEFF00CB
            AFAFA1E8492C2C2F17794D69E49EFF0037AAF44FB9FFD9}
          Anchors = []
        end
      end
    end
    object UniTabSheet5: TUniTabSheet
      Hint = ''
      Caption = 'Dados Financeiros'
      object chbx_Charging: TUniCheckBox
        Left = 2
        Top = 3
        Width = 515
        Height = 17
        Hint = ''
        Caption = 
          'O Sistema vai gerar o financeiro conforme informa'#231#245'es na TAG de ' +
          'cobran'#231'a'
        TabOrder = 0
      end
      object UniLabel22: TUniLabel
        Left = 20
        Top = 20
        Width = 453
        Height = 14
        Hint = ''
        Caption = 
          'Ao confirmarm na etapa que gera  o financeiro ser'#225' possivel revi' +
          'sar e  alterar o parcelamento'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 3
      end
      object chbx_Manual_Charging: TUniCheckBox
        Left = 2
        Top = 34
        Width = 192
        Height = 17
        Hint = ''
        Caption = 'Informar Financeiro Manualmento'
        TabOrder = 1
      end
      object chbx_Credits: TUniCheckBox
        Left = 2
        Top = 52
        Width = 192
        Height = 17
        Hint = ''
        Caption = 'Gerar cr'#233'ditos no Contas '#224' receber'
        TabOrder = 2
      end
    end
    object UniTabSheet6: TUniTabSheet
      Hint = ''
      Caption = 'Refer'#234'ncia CFOP'
      object dbg_Cfop: TUniDBGrid
        Left = 0
        Top = 0
        Width = 921
        Height = 372
        Hint = ''
        DataSource = ds_cfop
        LoadMask.WaitData = True
        LoadMask.Message = 'Carregando dados...'
        Align = alClient
        TabOrder = 0
        OnSetCellValue = dbg_CfopSetCellValue
        OnDrawColumnCell = dbg_CfopDrawColumnCell
        Columns = <
          item
            FieldName = 'nfeIdCfop'
            Title.Caption = 'C.F.O.P Origem'
            Width = 124
            ReadOnly = True
          end
          item
            FieldName = 'nfeCfop'
            Title.Caption = 'C.F.O.P Descri'#231#227'o'
            Width = 278
            ReadOnly = True
          end
          item
            FieldName = 'intIdCfop'
            Title.Caption = 'C.F.O.P Destino'
            Width = 92
            ReadOnly = True
          end
          item
            FieldName = 'intCfop'
            Title.Caption = 'C.F.O.P Descri'#231#227'o'
            Width = 274
            Editor = Dblcb_Hdd_List_Cfop
          end>
      end
      object UniHiddenPanel2: TUniHiddenPanel
        Left = 467
        Top = 68
        Width = 249
        Height = 187
        Hint = ''
        Visible = True
        object Dblcb_Hdd_List_Cfop: TUniDBLookupComboBox
          Left = 3
          Top = 18
          Width = 145
          Hint = ''
          ListFormat = '%s - %s'
          ListField = 'id;description'
          ListSource = ds_cfop_list
          KeyField = 'description'
          ListFieldIndex = 0
          AnyMatch = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel1: TUniLabel
          Left = 5
          Top = 3
          Width = 82
          Height = 14
          Hint = ''
          Caption = 'Nome do Produto'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 2
        end
      end
    end
    object UniTabSheet7: TUniTabSheet
      Hint = ''
      Caption = 'Informa'#231#245'es Adicionais'
      DesignSize = (
        921
        372)
      object UniGroupBox4: TUniGroupBox
        Left = 0
        Top = 1
        Width = 234
        Height = 60
        Hint = ''
        Caption = 'Controle de Retorno das Notas Fiscais'
        TabOrder = 0
        object UniLabel40: TUniLabel
          Left = 5
          Top = 15
          Width = 144
          Height = 14
          Hint = ''
          Caption = 'Informe Nota Fiscal de Origem'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 2
        end
        object E_NF_Origin: TUniEdit
          Left = 5
          Top = 31
          Width = 94
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          TabOrder = 0
        end
      end
      object UniGroupBox5: TUniGroupBox
        Left = 236
        Top = 2
        Width = 344
        Height = 60
        Hint = ''
        Caption = 'C'#225'lculo do Custo do Frete - ( Caso n'#227'o conste na nota fiscal)  '
        TabOrder = 1
        object UniLabel41: TUniLabel
          Left = 5
          Top = 14
          Width = 64
          Height = 14
          Hint = ''
          Caption = 'Informe Valor'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 2
        end
        object E_Vl_Freight_Extra: TUniEdit
          Left = 5
          Top = 30
          Width = 111
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          TabOrder = 1
        end
      end
      object UniGroupBox6: TUniGroupBox
        Left = 581
        Top = 2
        Width = 191
        Height = 60
        Hint = ''
        Caption = 'Informe Custos Adicionais'
        TabOrder = 2
        object UniLabel42: TUniLabel
          Left = 5
          Top = 15
          Width = 64
          Height = 14
          Hint = ''
          Caption = 'Informe Valor'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 1
        end
        object E_extra_Cost: TUniEdit
          Left = 5
          Top = 31
          Width = 127
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          TabOrder = 2
        end
      end
      object O: TUniLabel
        Left = 3
        Top = 62
        Width = 155
        Height = 13
        Hint = ''
        Caption = 'Observa'#231#227'o sobre a Importa'#231#227'o'
        TabOrder = 3
      end
      object M_Order_Note: TUniMemo
        Left = 2
        Top = 77
        Width = 666
        Height = 116
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
      end
      object Grb_Nr_Pedido: TUniGroupBox
        Left = 528
        Top = 64
        Width = 152
        Height = 76
        Hint = ''
        Caption = 'Pedido de Compra Vinculado'
        TabOrder = 5
        object L_Nr_OrderPuchase: TUniLabel
          Left = 5
          Top = 15
          Width = 85
          Height = 14
          Hint = ''
          Caption = 'Informe o N'#250'mero'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 1
        end
        object E_Nr_OrderPuchase: TUniEdit
          Left = 5
          Top = 31
          Width = 127
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object tbs_process: TUniTabSheet
      Hint = ''
      Caption = 'Acompanhamento'
      object M_Process: TUniMemo
        Left = 0
        Top = 0
        Width = 921
        Height = 372
        Hint = ''
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object UniPanel3: TUniPanel [1]
    Left = 0
    Top = 481
    Width = 929
    Height = 66
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      929
      66)
    object Sb_XML: TUniSpeedButton
      Left = 6
      Top = 5
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Ler XML'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_XMLClick
    end
    object Sb_Confirm: TUniSpeedButton
      Left = 97
      Top = 5
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Confirmar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_ConfirmClick
    end
    object Sb_Close: TUniSpeedButton
      Left = 188
      Top = 5
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Sair'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 3
      OnClick = Sb_CloseClick
    end
  end
  object UniPanel4: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 929
    Height = 81
    Hint = ''
    Align = alTop
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      929
      81)
    object chbx_Other: TUniCheckBox
      Left = 4
      Top = 60
      Width = 515
      Height = 17
      Hint = ''
      Visible = False
      Caption = 
        'Quero importar um XML que n'#227'o emitido para o meu CNPJ( O Arquivo' +
        ' XML deve estar no Computador)'
      Anchors = [akLeft, akBottom]
      TabOrder = 1
    end
    object UniGroupBox1: TUniGroupBox
      Left = 4
      Top = 1
      Width = 441
      Height = 55
      Hint = ''
      Caption = 'Informe a Chave da Nota Fiscal Eletr'#244'nica'
      TabOrder = 2
      object E_NFE_Key: TUniEdit
        Left = 4
        Top = 15
        Width = 423
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        TabOrder = 0
        OnChange = E_NFE_KeyChange
      end
      object Lb_Nr_Caracteres: TUniLabel
        Left = 5
        Top = 38
        Width = 115
        Height = 14
        Hint = ''
        Caption = 'N'#250'mero de Caracteres: '
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 2
      end
    end
    object UniGroupBox7: TUniGroupBox
      Left = 447
      Top = 1
      Width = 332
      Height = 55
      Hint = ''
      Caption = 'Manifesta'#231#227'o do Destinat'#225'rio'
      TabOrder = 3
      object ctn_NfeEvents: TUniContainerPanel
        Left = 2
        Top = 15
        Width = 328
        Height = 38
        Hint = ''
        ParentColor = False
        Align = alBottom
        TabOrder = 1
      end
    end
  end
  object cds_nfeItems: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nfeProduct'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'nfeUnidade'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'nfeQtde'
        DataType = ftFloat
      end
      item
        Name = 'nfeUnitValue'
        DataType = ftFloat
      end
      item
        Name = 'nfeTotalValue'
        DataType = ftFloat
      end
      item
        Name = 'nfeDiscountValue'
        DataType = ftFloat
      end
      item
        Name = 'nfeBarCode'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'nfeIdProduct'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'IntIdProduct'
        DataType = ftInteger
      end
      item
        Name = 'intProduct'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'intIdStock'
        DataType = ftInteger
      end
      item
        Name = 'intStock'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'nfeNCM'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'nfeOrigin'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nfeSubTrib'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nfeNrITem'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'duplicate'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'selected'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OrderPuchase'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOnDemand = False
    Params = <>
    StoreDefs = True
    AfterScroll = cds_nfeItemsAfterScroll
    OnCalcFields = cds_nfeItemsCalcFields
    Left = 48
    Top = 210
    object cds_nfeItemsnfeNrITem: TStringField
      FieldName = 'nfeNrITem'
      Size = 10
    end
    object cds_nfeItemsnfeProduct: TStringField
      FieldName = 'nfeProduct'
      Size = 13
    end
    object cds_nfeItemsnfeUnidade: TStringField
      FieldName = 'nfeUnidade'
      Size = 3
    end
    object cds_nfeItemsnfeQtde: TFloatField
      FieldName = 'nfeQtde'
      DisplayFormat = '0.00'
    end
    object cds_nfeItemsnfeUnitValue: TFloatField
      FieldName = 'nfeUnitValue'
      DisplayFormat = '0.00'
    end
    object cds_nfeItemsnfeTotalValue: TFloatField
      FieldName = 'nfeTotalValue'
      DisplayFormat = '0.00'
    end
    object cds_nfeItemsnfeDiscountValue: TFloatField
      FieldName = 'nfeDiscountValue'
    end
    object cds_nfeItemsnfeBarCode: TStringField
      FieldName = 'nfeBarCode'
      Size = 25
    end
    object cds_nfeItemsnfeIdProduct: TStringField
      FieldName = 'nfeIdProduct'
      Size = 25
    end
    object cds_nfeItemsIntIdProduct: TIntegerField
      FieldName = 'IntIdProduct'
    end
    object cds_nfeItemsintProduct: TStringField
      FieldName = 'intProduct'
      Size = 100
    end
    object cds_nfeItemsintIdStock: TIntegerField
      FieldName = 'intIdStock'
    end
    object cds_nfeItemsintStock: TStringField
      FieldName = 'intStock'
      Size = 100
    end
    object cds_nfeItemsnfeNCM: TStringField
      FieldName = 'nfeNCM'
      Size = 8
    end
    object cds_nfeItemsnfeOrigin: TStringField
      FieldName = 'nfeOrigin'
      Size = 1
    end
    object cds_nfeItemsnfeSubTrib: TStringField
      FieldName = 'nfeSubTrib'
      Size = 1
    end
    object cds_nfeItemsduplicate: TStringField
      FieldName = 'duplicate'
      Size = 1
    end
    object cds_nfeItemsconferido: TStringField
      FieldKind = fkCalculated
      FieldName = 'conferido'
      Calculated = True
    end
    object cds_nfeItemsOrderPuchase: TIntegerField
      FieldName = 'OrderPuchase'
    end
  end
  object ds_nfeItems: TDataSource
    DataSet = cds_nfeItems
    Left = 48
    Top = 266
  end
  object ds_cfop: TDataSource
    DataSet = cds_cfop
    Left = 120
    Top = 266
  end
  object cds_cfop: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    Left = 120
    Top = 210
    object cds_cfopnfeCfop: TStringField
      FieldName = 'nfeCfop'
    end
    object cds_cfopnfeIdCfop: TStringField
      FieldName = 'nfeIdCfop'
    end
    object cds_cfopintCfop: TStringField
      FieldName = 'intCfop'
    end
    object cds_cfopintIdCfop: TStringField
      FieldName = 'intIdCfop'
    end
  end
  object cds_merchandise: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dsp_Merchandise'
    Left = 188
    Top = 209
    object cds_merchandiseid: TIntegerField
      FieldName = 'id'
      Required = True
      DisplayFormat = '000'
    end
    object cds_merchandisedescription: TStringField
      FieldName = 'description'
      Required = True
      Size = 100
    end
  end
  object ds_merchandise: TDataSource
    DataSet = cds_merchandise
    Left = 188
    Top = 265
  end
  object dsp_Merchandise: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 188
    Top = 159
  end
  object dsp_stock: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 158
  end
  object cds_stock: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dsp_Merchandise'
    Left = 280
    Top = 208
    object cds_stockid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_stockdescription: TStringField
      FieldName = 'description'
      Size = 45
    end
    object cds_stockkind: TStringField
      FieldName = 'kind'
      FixedChar = True
      Size = 1
    end
  end
  object ds_stock: TDataSource
    DataSet = cds_stock
    Left = 280
    Top = 264
  end
  object dsp_cfop_list: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 360
    Top = 158
  end
  object cds_cfop_list: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dsp_cfop_list'
    Left = 360
    Top = 208
    object cds_cfop_listid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cds_cfop_listdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
  object ds_cfop_list: TDataSource
    DataSet = cds_cfop_list
    Left = 360
    Top = 264
  end
  object pop_upd_Merchandise: TUniPopupMenu
    Left = 184
    Top = 312
    object UpdMercVincular: TUniMenuItem
      Caption = 'Atualiza Lista de V'#237'nculo'
      OnClick = UpdMercVincularClick
    end
    object openMerchandise: TUniMenuItem
      Caption = 'Cadastro Mercadoria'
      OnClick = openMerchandiseClick
    end
  end
  object UniFileUpload: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = '*.xml'
    Title = 'Carregar Arquivo'
    Messages.Uploading = 'Carregando'
    Messages.PleaseWait = 'Por favor. Aguarde'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando'
    Messages.UploadError = 'Erro no Carregamento'
    Messages.Upload = 'Carregar'
    Messages.NoFileError = 'Por favor selecione o arquivo'
    Messages.BrowseText = 'Procurar'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    Overwrite = True
    OnCompleted = UniFileUploadCompleted
    Left = 432
    Top = 160
  end
end
