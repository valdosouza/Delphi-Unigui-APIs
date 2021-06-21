inherited SeaInterface: TSeaInterface
  ClientWidth = 534
  Caption = 'Pesquisa de Interface'
  ExplicitWidth = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 534
    ExplicitWidth = 534
    inherited pc_search: TUniPageControl
      Width = 530
      ExplicitWidth = 530
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 522
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 522
          ExplicitWidth = 522
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
            TabOrder = 1
          end
          object E_ID_Search: TUniEdit
            Left = 6
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object L_NameCompany: TUniLabel
            Left = 65
            Top = 6
            Width = 27
            Height = 14
            Hint = ''
            Caption = 'Nome'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_Description: TUniEdit
            Left = 64
            Top = 21
            Width = 406
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
          object L_Kind: TUniLabel
            Left = 472
            Top = 6
            Width = 20
            Height = 14
            Hint = ''
            Caption = 'Tipo'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object E_Kind: TUniEdit
            Left = 466
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 6
          end
        end
        inherited pnl_config: TUniPanel
          Width = 522
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 522
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 522
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 52
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 371
            end
            item
              FieldName = 'kind'
              Title.Caption = 'Tipo'
              Width = 97
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 534
    ExplicitWidth = 534
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      DisplayWidth = 8
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      DisplayWidth = 68
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
    object cds_searchkind: TStringField
      DisplayWidth = 18
      FieldName = 'kind'
      Origin = 'kind'
      Size = 26
    end
  end
end
