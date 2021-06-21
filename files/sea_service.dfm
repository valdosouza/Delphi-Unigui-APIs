inherited SeaService: TSeaService
  ClientWidth = 569
  Caption = 'Pesquisa de Servi'#231'o'
  ExplicitWidth = 585
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 569
    ExplicitWidth = 569
    inherited pc_search: TUniPageControl
      Width = 565
      ExplicitWidth = 565
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 557
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 557
          ExplicitWidth = 557
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
          object E_Codigo: TUniEdit
            Left = 3
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object label2: TUniLabel
            Left = 62
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
          object E_Description: TUniEdit
            Left = 57
            Top = 21
            Width = 500
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
        ExplicitWidth = 557
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 557
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 479
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 569
    ExplicitWidth = 569
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
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
end
