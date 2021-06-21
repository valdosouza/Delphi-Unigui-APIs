inherited SeaClinModule: TSeaClinModule
  ClientWidth = 549
  Caption = 'Pesquisa de M'#243'dulos de Avalia'#231#227'o'
  ExplicitWidth = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 549
    ExplicitWidth = 549
    inherited pc_search: TUniPageControl
      Width = 545
      ActivePage = tbs_param
      ExplicitWidth = 545
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 537
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 537
          ExplicitWidth = 537
          object pnl_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 533
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object E_Codigo: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 56
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              ReadOnly = True
              FieldLabel = 'C'#243'digo'
              FieldLabelAlign = laTop
            end
            object E_Description: TUniEdit
              AlignWithMargins = True
              Left = 65
              Top = 3
              Width = 465
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Align = alClient
              TabOrder = 2
              FieldLabel = 'Descri'#231#227'o'
              FieldLabelAlign = laTop
            end
          end
        end
        inherited pnl_config: TUniPanel
          Width = 537
          ExplicitWidth = 537
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 537
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 537
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'sequence_id'
              Title.Caption = 'Sequ'#234'ncia'
              Width = 76
            end
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
    Width = 549
    ExplicitWidth = 549
  end
  inherited cds_msg: TClientDataSet
    Left = 240
    Top = 73
  end
  inherited ds_msg: TDataSource
    Left = 288
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchsequence_id: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      DisplayWidth = 12
      FieldName = 'sequence_id'
      Origin = 'sequence_id'
    end
    object cds_searchdescription: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'description'
      Origin = 'description'
      Size = 50
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 64
  end
end
