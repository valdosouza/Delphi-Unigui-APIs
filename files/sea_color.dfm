inherited SeaColor: TSeaColor
  ClientWidth = 387
  Caption = 'Pesquisa de Cores'
  ExplicitWidth = 403
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 387
    ExplicitWidth = 387
    inherited pc_search: TUniPageControl
      Width = 383
      ExplicitWidth = 383
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 375
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 375
          ExplicitWidth = 375
          object L_Codigo: TUniLabel
            Left = 4
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
            Left = 60
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
            Left = 54
            Top = 19
            Width = 321
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object E_Codigo: TUniEdit
            Left = 4
            Top = 19
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 4
            ReadOnly = True
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 4
            Top = 41
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 5
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 375
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 375
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
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
  inherited Pnl_Botoes: TUniPanel
    Width = 387
    ExplicitWidth = 387
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
  end
end
