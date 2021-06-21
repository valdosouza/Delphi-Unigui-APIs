inherited SeaKind: TSeaKind
  Caption = 'Pesquisa de Tipo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          object UniLabel1: TUniLabel
            Left = 5
            Top = 46
            Width = 34
            Height = 13
            Hint = ''
            Caption = 'M'#243'dulo'
            TabOrder = 1
          end
          object L_Codigo: TUniLabel
            Left = 6
            Top = 6
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
          object L_Description: TUniLabel
            Left = 64
            Top = 6
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_ID_Search: TUniEdit
            Left = 6
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 4
            ReadOnly = True
          end
          object E_Description: TUniEdit
            Left = 64
            Top = 21
            Width = 498
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 5
          end
          object Cb_Custo: TUniComboBox
            Left = 5
            Top = 60
            Width = 145
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'Setes'
              'Cliente')
            TabOrder = 6
            IconItems = <>
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'Codigo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 304
            end>
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 544
    Top = 129
  end
  inherited ds_msg: TDataSource
    Left = 600
    Top = 136
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 50
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 584
    Top = 56
  end
end
