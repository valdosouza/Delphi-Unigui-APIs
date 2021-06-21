inherited SeaVehKind: TSeaVehKind
  ClientWidth = 570
  Caption = 'Pesquisa Tipo de Veiculo'
  ExplicitWidth = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 570
    ExplicitWidth = 570
    inherited pc_search: TUniPageControl
      Width = 566
      ExplicitWidth = 566
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 558
        inherited pnl_param: TUniPanel
          Width = 558
          ExplicitWidth = 558
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
            Left = 58
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
        ExplicitWidth = 558
        inherited dbg_Search: TUniDBGrid
          Width = 558
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 476
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 570
    ExplicitWidth = 570
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
