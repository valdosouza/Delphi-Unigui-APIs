inherited SeaObservation: TSeaObservation
  ClientWidth = 508
  Caption = 'Pesquisa de Observa'#231#227'o'
  ExplicitWidth = 524
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 508
    ExplicitWidth = 508
    inherited pc_search: TUniPageControl
      Width = 504
      ExplicitWidth = 504
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 496
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 496
          ExplicitWidth = 496
          object E_Description: TUniEdit
            Left = -1
            Top = 21
            Width = 497
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 1
          end
          object L_NameCompany: TUniLabel
            Left = 6
            Top = 6
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 496
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 496
          Columns = <
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 604
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 508
    ExplicitWidth = 508
  end
  inherited cds_search: TClientDataSet
    Left = 160
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
