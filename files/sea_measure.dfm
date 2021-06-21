inherited SeaMeasure: TSeaMeasure
  ClientWidth = 451
  Caption = 'Pesquisa de Medidas'
  ExplicitWidth = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 451
    ExplicitWidth = 451
    inherited pc_search: TUniPageControl
      Width = 447
      ExplicitWidth = 447
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 439
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 439
          ExplicitWidth = 439
          object L_Codigo: TUniLabel
            Left = 8
            Top = 8
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
            Left = 67
            Top = 8
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
            Left = 66
            Top = 23
            Width = 315
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object E_Codigo: TUniEdit
            Left = 8
            Top = 23
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 9
            Top = 47
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 5
          end
          object UniLabel1: TUniLabel
            Left = 382
            Top = 8
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
            Left = 376
            Top = 23
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
        ExplicitWidth = 439
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 439
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 328
            end
            item
              FieldName = 'abbreviation'
              Title.Caption = 'Abreviatura'
              Width = 61
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 451
    ExplicitWidth = 451
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Required = True
      Size = 100
    end
    object cds_searchabbreviation: TStringField
      FieldName = 'abbreviation'
      Size = 3
    end
  end
end
