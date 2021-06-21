inherited SeaBankHistoric: TSeaBankHistoric
  ClientWidth = 701
  Caption = 'Pesquisa Historico Banco'
  ExplicitWidth = 717
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 701
    ExplicitWidth = 701
    inherited pc_search: TUniPageControl
      Width = 697
      ActivePage = tbs_param
      ExplicitWidth = 697
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 689
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 689
          ExplicitTop = -2
          ExplicitWidth = 689
          object pnl_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 685
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 4
            ExplicitTop = 10
            object E_ID: TUniEdit
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 51
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'C'#243'digo'
              FieldLabelAlign = laTop
            end
            object E_Description: TUniEdit
              AlignWithMargins = True
              Left = 61
              Top = 4
              Width = 346
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Descri'#231#227'o'
              FieldLabelAlign = laTop
            end
            object Ctn_Bank: TUniContainerPanel
              Left = 410
              Top = 1
              Width = 274
              Height = 50
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 3
            end
          end
        end
        inherited pnl_config: TUniPanel
          Width = 689
          ExplicitWidth = 689
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 689
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 689
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 368
            end
            item
              FieldName = 'bank'
              Title.Caption = 'Banco'
              Width = 265
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 701
    ExplicitWidth = 701
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_searchbank: TStringField
      FieldName = 'bank'
      ReadOnly = True
      Size = 100
    end
    object cds_searchbank_id: TIntegerField
      FieldName = 'bank_id'
      ReadOnly = True
    end
  end
  inherited MenuTask: TUniMainMenu
    Top = 64
  end
end
