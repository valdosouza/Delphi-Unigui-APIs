inherited SeaBankAccount: TSeaBankAccount
  ClientHeight = 428
  ClientWidth = 540
  Caption = 'Pesquisa Contas Banc'#225'rias'
  ExplicitWidth = 556
  ExplicitHeight = 487
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 540
    Height = 364
    ExplicitWidth = 518
    ExplicitHeight = 364
    inherited pc_search: TUniPageControl
      Width = 536
      Height = 360
      ActivePage = tbs_param
      ExplicitWidth = 514
      ExplicitHeight = 360
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 506
        ExplicitHeight = 332
        inherited pnl_param: TUniPanel
          Width = 528
          Height = 301
          ExplicitTop = -2
          ExplicitWidth = 528
          ExplicitHeight = 301
          object pnl_parameter_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 524
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            ExplicitWidth = 536
            object E_Agency: TUniEdit
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 85
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Ag'#234'ncia'
              FieldLabelAlign = laTop
            end
            object E_Number: TUniEdit
              AlignWithMargins = True
              Left = 95
              Top = 4
              Width = 102
              Height = 44
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Conta Corrente'
              FieldLabelAlign = laTop
            end
            object Ctn_Bank: TUniContainerPanel
              Left = 200
              Top = 1
              Width = 323
              Height = 50
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 3
              ExplicitWidth = 335
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 301
          Width = 528
          ExplicitTop = 301
          ExplicitWidth = 506
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 506
        ExplicitHeight = 332
        inherited dbg_Search: TUniDBGrid
          Width = 528
          Height = 332
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'agency'
              Title.Caption = 'Ag'#234'ncia'
              Width = 52
            end
            item
              FieldName = 'number'
              Title.Caption = 'Conta Corrente'
              Width = 79
            end
            item
              FieldName = 'bank'
              Title.Caption = 'Banco'
              Width = 604
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 364
    Width = 540
    ExplicitTop = 364
    ExplicitWidth = 518
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchnumber: TStringField
      FieldName = 'number'
      Size = 10
    end
    object cds_searchagency: TStringField
      FieldName = 'agency'
      Size = 8
    end
    object cds_searchbank: TStringField
      FieldName = 'bank'
      ReadOnly = True
      Size = 100
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 88
  end
end
