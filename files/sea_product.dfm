inherited SeaProduct: TSeaProduct
  ClientWidth = 612
  Caption = 'Pesquisa de Produto'
  ExplicitWidth = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 612
    ExplicitWidth = 612
    inherited pc_search: TUniPageControl
      Width = 608
      ActivePage = tbs_param
      ExplicitWidth = 608
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 600
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 600
          ExplicitWidth = 600
          object L_Codigo: TUniLabel
            Left = 5
            Top = 6
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object L_NameCompany: TUniLabel
            Left = 5
            Top = 47
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
          object E_Description: TUniEdit
            Left = 5
            Top = 62
            Width = 586
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object E_ID_Search: TUniEdit
            Left = 5
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object L_CodigoInterno: TUniLabel
            Left = 63
            Top = 6
            Width = 108
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo Interno/F'#225'brica'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object E_Identifier: TUniEdit
            Left = 63
            Top = 21
            Width = 135
            Hint = ''
            Text = ''
            TabOrder = 6
          end
          object L_Categoria: TUniLabel
            Left = 200
            Top = 6
            Width = 46
            Height = 14
            Hint = ''
            Caption = 'Categoria'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 7
          end
          object E_Category: TUniEdit
            Left = 196
            Top = 21
            Width = 395
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 8
          end
          object Rg_active: TUniRadioGroup
            Left = 295
            Top = 88
            Width = 296
            Height = 37
            Hint = ''
            Items.Strings = (
              'SIM'
              'N'#195'O'
              'TODOS')
            ItemIndex = 2
            Caption = 'Produto Ativo'
            TabOrder = 9
            Columns = 3
          end
          object Rg_published: TUniRadioGroup
            Left = 5
            Top = 89
            Width = 287
            Height = 36
            Hint = ''
            Items.Strings = (
              'SIM'
              'N'#195'O'
              'TODOS')
            ItemIndex = 2
            Caption = 'Publicado na Loja Virtual'
            TabOrder = 10
            Columns = 3
          end
        end
        inherited pnl_config: TUniPanel
          Width = 600
          ExplicitWidth = 600
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 600
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 600
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 604
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 612
    ExplicitWidth = 612
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
    Top = 176
  end
end
