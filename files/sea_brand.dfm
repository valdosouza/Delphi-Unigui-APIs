inherited SeaBrand: TSeaBrand
  ClientHeight = 510
  ClientWidth = 566
  Caption = 'Pesquisa de Marcas'
  ExplicitWidth = 582
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 566
    Height = 446
    ExplicitWidth = 566
    ExplicitHeight = 446
    inherited pc_search: TUniPageControl
      Width = 562
      Height = 442
      ExplicitWidth = 562
      ExplicitHeight = 442
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 554
        ExplicitHeight = 414
        inherited pnl_param: TUniPanel
          Width = 554
          Height = 383
          ExplicitWidth = 554
          ExplicitHeight = 383
          object label1: TUniLabel
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
          object label2: TUniLabel
            Left = 62
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
            Top = 21
            Width = 500
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
        end
        inherited pnl_config: TUniPanel
          Top = 383
          Width = 554
          ExplicitTop = 383
          ExplicitWidth = 554
          inherited chbx_limit_result: TUniCheckBox
            ExplicitLeft = 4
            ExplicitTop = 4
          end
          inherited E_Limit: TUniEdit
            ExplicitTop = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 554
        ExplicitHeight = 414
        inherited dbg_Search: TUniDBGrid
          Width = 554
          Height = 414
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 446
    Width = 566
    ExplicitTop = 446
    ExplicitWidth = 566
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchdescription: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
end
