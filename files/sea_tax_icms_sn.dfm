inherited SeaTaxIcmsSn: TSeaTaxIcmsSn
  ClientHeight = 437
  ClientWidth = 404
  Caption = 'Situa'#231#227'o Tribut'#225'ria - Icms Simples Nacional'
  ExplicitWidth = 420
  ExplicitHeight = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 404
    Height = 373
    ExplicitWidth = 404
    ExplicitHeight = 373
    inherited pc_search: TUniPageControl
      Width = 400
      Height = 369
      ExplicitWidth = 400
      ExplicitHeight = 369
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 392
        ExplicitHeight = 341
        inherited pnl_param: TUniPanel
          Width = 392
          Height = 341
          ExplicitWidth = 392
          ExplicitHeight = 341
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
            Left = 65
            Top = 21
            Width = 308
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
        ExplicitWidth = 392
        ExplicitHeight = 341
        inherited dbg_Search: TUniDBGrid
          Width = 392
          Height = 341
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 37
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 373
    Width = 404
    ExplicitTop = 373
    ExplicitWidth = 404
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
end
