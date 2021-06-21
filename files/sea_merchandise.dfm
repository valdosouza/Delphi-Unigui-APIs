inherited SeaMerchandise: TSeaMerchandise
  ClientHeight = 502
  ClientWidth = 850
  Caption = 'Pesquisa de Mercadoria'
  ExplicitWidth = 866
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 850
    Height = 438
    ExplicitWidth = 850
    ExplicitHeight = 438
    inherited pc_search: TUniPageControl
      Width = 846
      Height = 434
      ExplicitWidth = 846
      ExplicitHeight = 434
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 838
        ExplicitHeight = 406
        inherited pnl_param: TUniPanel
          Width = 838
          Height = 375
          ExplicitWidth = 838
          ExplicitHeight = 375
          inherited E_Identifier: TUniEdit
            Left = 62
            Width = 131
            ExplicitLeft = 62
            ExplicitWidth = 131
          end
          object L_CodigoBarras: TUniLabel
            Left = 5
            Top = 130
            Width = 69
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo Barras'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 11
          end
          object E_CodeBar: TUniEdit
            Left = 5
            Top = 145
            Width = 146
            Hint = ''
            Text = ''
            TabOrder = 12
          end
          object L_Marca: TUniLabel
            Left = 156
            Top = 130
            Width = 30
            Height = 14
            Hint = ''
            Caption = 'Marca'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 13
          end
          object E_brand: TUniEdit
            Left = 154
            Top = 145
            Width = 221
            Hint = ''
            Text = ''
            TabOrder = 14
          end
          object L_LocalizaçãoEndereço: TUniLabel
            Left = 375
            Top = 130
            Width = 107
            Height = 14
            Hint = ''
            Caption = 'Localiza'#231#227'o Endere'#231'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 15
          end
          object E_Location: TUniEdit
            Left = 377
            Top = 145
            Width = 212
            Hint = ''
            Text = ''
            TabOrder = 16
          end
          object E_Aplication: TUniEdit
            Left = 5
            Top = 181
            Width = 370
            Hint = ''
            Text = ''
            TabOrder = 17
          end
          object L_Aplicação: TUniLabel
            Left = 5
            Top = 167
            Width = 48
            Height = 14
            Hint = ''
            Caption = 'Aplica'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 18
          end
          object Cb_kind: TUniComboBox
            Left = 6
            Top = 224
            Width = 145
            Hint = ''
            Style = csOwnerDrawFixed
            Text = 'Todos '
            Items.Strings = (
              'Todos '
              'Produto Acabado'
              'Materia Prima'
              'Produto Consumo'
              'Autom'#225'tico')
            ItemIndex = 0
            TabOrder = 19
            IconItems = <>
          end
          object L_TipoProduto: TUniLabel
            Left = 6
            Top = 206
            Width = 75
            Height = 14
            Hint = ''
            Caption = 'Tipo de Produto'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 20
          end
        end
        inherited pnl_config: TUniPanel
          Top = 375
          Width = 838
          ExplicitTop = 375
          ExplicitWidth = 838
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 838
        ExplicitHeight = 406
        inherited dbg_Search: TUniDBGrid
          Width = 838
          Height = 406
          WebOptions.RetainCursorOnSort = False
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'product'
              Title.Caption = 'Produto'
              Width = 491
            end
            item
              FieldName = 'category'
              Title.Caption = 'Categoria'
              Width = 146
              ReadOnly = True
            end
            item
              FieldName = 'id_internal'
              Title.Caption = 'C'#243'digo Interno'
              Width = 94
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 438
    Width = 850
    ExplicitTop = 438
    ExplicitWidth = 850
  end
  inherited cds_msg: TClientDataSet
    Left = 648
    Top = 41
  end
  inherited ds_msg: TDataSource
    Left = 696
    Top = 40
  end
  inherited ds_search: TDataSource
    Top = 314
  end
  inherited cds_search: TClientDataSet
    Top = 266
  end
  inherited DSP: TDataSetProvider
    Top = 216
  end
  inherited MenuTask: TUniMainMenu
    Left = 640
    Top = 65528
  end
end
