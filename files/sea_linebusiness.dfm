inherited SeaLinebusiness: TSeaLinebusiness
  ClientWidth = 392
  Caption = 'Pesquisa Ramos de Atividade'
  ExplicitWidth = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 392
    ExplicitWidth = 392
    inherited pc_search: TUniPageControl
      Width = 388
      ExplicitWidth = 388
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 380
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 380
          ExplicitWidth = 380
          object L_Codigo: TUniLabel
            Left = 5
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
          object E_Codigo: TUniEdit
            Left = 5
            Top = 24
            Width = 46
            Hint = ''
            Text = ''
            TabOrder = 2
            TabStop = False
          end
          object E_Description: TUniEdit
            Left = 48
            Top = 24
            Width = 332
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object L_descricao: TUniLabel
            Left = 53
            Top = 8
            Width = 156
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o do Ramo de Atividade'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 4
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 5
            Top = 49
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
        ExplicitWidth = 380
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 380
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
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 392
    ExplicitWidth = 392
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
      Size = 100
    end
  end
end
