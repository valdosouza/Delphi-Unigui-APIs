inherited SeaPriceList: TSeaPriceList
  ClientWidth = 377
  Caption = 'Pesquisa Tabela de Pre'#231'o'
  ExplicitWidth = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 377
    ExplicitWidth = 377
    inherited pc_search: TUniPageControl
      Width = 373
      ExplicitWidth = 373
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 365
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 365
          ExplicitWidth = 365
          object E_Codigo: TUniEdit
            Left = 5
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object E_Description: TUniEdit
            Left = 56
            Top = 21
            Width = 309
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object label1: TUniLabel
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
            TabOrder = 3
          end
          object label2: TUniLabel
            Left = 63
            Top = 6
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 365
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 365
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 295
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 377
    ExplicitWidth = 377
  end
  inherited cds_search: TClientDataSet
    Filtered = True
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
      Size = 45
    end
  end
end
