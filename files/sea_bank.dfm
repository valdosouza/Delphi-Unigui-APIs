inherited SeaBank: TSeaBank
  ClientWidth = 564
  Caption = 'Pesquisa do Banco'
  ExplicitWidth = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 564
    ExplicitWidth = 564
    inherited pc_search: TUniPageControl
      Width = 560
      ActivePage = tbs_param
      ExplicitWidth = 560
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 552
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 552
          ExplicitLeft = -1
          ExplicitTop = -2
          ExplicitWidth = 552
          object pnl_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 548
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object E_Id: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 49
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'C'#243'digo'
              FieldLabelAlign = laTop
            end
            object E_Number: TUniEdit
              AlignWithMargins = True
              Left = 58
              Top = 3
              Width = 53
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'N'#250'mero'
              FieldLabelAlign = laTop
            end
            object E_Name_Company: TUniEdit
              AlignWithMargins = True
              Left = 117
              Top = 3
              Width = 428
              Height = 46
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Nome'
              FieldLabelAlign = laTop
            end
          end
          object pnl_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 548
            Height = 29
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object chbx_cad_active: TUniCheckBox
              Left = 0
              Top = 0
              Width = 136
              Height = 29
              Hint = ''
              Checked = True
              Caption = 'Cadastro Ativo'
              Align = alLeft
              TabOrder = 1
            end
          end
        end
        inherited pnl_config: TUniPanel
          Width = 552
          ExplicitWidth = 552
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 552
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 552
          ReadOnly = True
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 56
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome'
              Width = 445
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 564
    ExplicitWidth = 564
  end
  inherited ds_msg: TDataSource
    Left = 224
    Top = 120
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      ReadOnly = True
      Size = 100
    end
    object cds_searchnumber: TStringField
      FieldName = 'number'
      Required = True
      Size = 3
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 136
  end
end
