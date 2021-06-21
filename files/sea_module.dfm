inherited SeaModule: TSeaModule
  ClientHeight = 411
  ClientWidth = 550
  Caption = 'Pesquisa de Modulos'
  BorderStyle = bsSingle
  ExplicitWidth = 556
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 550
    Height = 347
    ExplicitWidth = 550
    ExplicitHeight = 347
    inherited pc_search: TUniPageControl
      Width = 546
      Height = 343
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 546
      ExplicitHeight = 343
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 538
        ExplicitHeight = 315
        inherited pnl_param: TUniPanel
          Width = 538
          Height = 315
          ExplicitWidth = 538
          ExplicitHeight = 315
          object L_Codigo: TUniLabel
            Left = 3
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
            Left = 3
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object L_NameCompany: TUniLabel
            Left = 61
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
            Left = 60
            Top = 21
            Width = 477
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 538
        ExplicitHeight = 315
        inherited dbg_Search: TUniDBGrid
          Width = 538
          Height = 315
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 46
            end
            item
              FieldName = 'description'
              Title.Caption = 'Nome'
              Width = 431
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 347
    Width = 550
    ExplicitTop = 347
    ExplicitWidth = 550
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      DisplayWidth = 7
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      DisplayWidth = 100
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
end
