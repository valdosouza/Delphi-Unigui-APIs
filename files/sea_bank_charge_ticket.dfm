inherited SeaBankChargeTicket: TSeaBankChargeTicket
  ClientHeight = 461
  ClientWidth = 673
  Caption = 'Pesquisa de Carteira de Cobran'#231'a'
  ExplicitWidth = 689
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 673
    Height = 397
    ExplicitWidth = 673
    ExplicitHeight = 397
    inherited pc_search: TUniPageControl
      Width = 669
      Height = 393
      ActivePage = tbs_param
      ExplicitWidth = 669
      ExplicitHeight = 393
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 661
        ExplicitHeight = 365
        inherited pnl_param: TUniPanel
          Width = 661
          Height = 334
          ExplicitWidth = 661
          ExplicitHeight = 334
          object pnl_param_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 657
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            Caption = ''
            ExplicitLeft = -4
            ExplicitTop = 152
            ExplicitWidth = 585
            object Ctn_Bank: TUniContainerPanel
              Left = 1
              Top = 1
              Width = 451
              Height = 50
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 1
              ExplicitLeft = 3
              ExplicitWidth = 459
            end
            object E_Number: TUniEdit
              AlignWithMargins = True
              Left = 455
              Top = 4
              Width = 198
              Height = 44
              Hint = ''
              Text = ''
              Align = alRight
              TabOrder = 2
              FieldLabel = 'C'#243'digo/N'#250'mero'
              FieldLabelAlign = laTop
              ExplicitLeft = 456
              ExplicitTop = 3
            end
          end
          object pnl_param_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 657
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            Caption = ''
            ExplicitLeft = 16
            ExplicitTop = 192
            ExplicitWidth = 505
            object E_Description: TUniEdit
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 452
              Height = 44
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 1
              FieldLabel = 'Descri'#231#227'o Carteira'
              FieldLabelAlign = laTop
              ExplicitLeft = 1
              ExplicitTop = 1
              ExplicitWidth = 306
              ExplicitHeight = 50
            end
            object Rg_Emission_By: TUniRadioGroup
              Left = 459
              Top = 1
              Width = 197
              Height = 50
              Hint = ''
              Items.Strings = (
                'Cliente'
                'Banco')
              Align = alRight
              Caption = 'Emiss'#227'o'
              TabOrder = 2
              Columns = 2
              ExplicitLeft = 307
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 334
          Width = 661
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 661
        ExplicitHeight = 365
        inherited dbg_Search: TUniDBGrid
          Width = 661
          Height = 365
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 55
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 394
            end
            item
              FieldName = 'emission_by'
              Title.Caption = 'Emiss'#227'o'
              Width = 73
            end
            item
              FieldName = 'bank'
              Title.Caption = 'Banco'
              Width = 135
              ReadOnly = True
            end
            item
              FieldName = 'bank_id'
              Title.Caption = 'bank_id'
              Width = 64
              Visible = False
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 397
    Width = 673
    ExplicitTop = 397
    ExplicitWidth = 673
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
    object cds_searchnumber: TStringField
      FieldName = 'number'
      Required = True
      Size = 50
    end
    object cds_searchemission_by: TStringField
      FieldName = 'emission_by'
      Required = True
      FixedChar = True
      Size = 1
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
end
