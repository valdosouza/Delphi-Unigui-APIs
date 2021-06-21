inherited SeaPackage: TSeaPackage
  ClientWidth = 564
  Caption = 'Pesquisa de Embalagem'
  ExplicitWidth = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 564
    ExplicitWidth = 564
    inherited pc_search: TUniPageControl
      Width = 560
      ExplicitWidth = 560
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 552
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 552
          ExplicitWidth = 552
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
            TabOrder = 2
          end
          object E_Description: TUniEdit
            Left = 61
            Top = 21
            Width = 435
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object E_Codigo: TUniEdit
            Left = 3
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 4
            Top = 45
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 5
          end
          object UniLabel1: TUniLabel
            Left = 495
            Top = 6
            Width = 57
            Height = 14
            Hint = ''
            Caption = 'Abreviatura'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 6
          end
          object E_Abbreviation: TUniEdit
            Left = 489
            Top = 21
            Width = 63
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            TabOrder = 7
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 552
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 552
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 401
            end
            item
              FieldName = 'abbreviation'
              Title.Caption = 'Abreviatura'
              Width = 95
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 564
    ExplicitWidth = 564
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
    object cds_searchabbreviation: TStringField
      FieldName = 'abbreviation'
      Origin = 'abbreviation'
      Size = 3
    end
  end
end
