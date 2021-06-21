inherited SeaEntityFiscal: TSeaEntityFiscal
  ClientWidth = 786
  Caption = 'Pesquisa de Entidade Fiscal'
  ExplicitWidth = 802
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 786
    ExplicitWidth = 786
    inherited pc_search: TUniPageControl
      Width = 782
      ExplicitWidth = 782
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 774
        inherited pnl_param: TUniPanel
          Width = 774
          ExplicitWidth = 774
          inherited ChBx_Active: TUniCheckBox
            Left = 13
            Top = 214
            ExplicitLeft = 13
            ExplicitTop = 214
          end
          inherited pnl_param_row_1: TUniPanel
            Width = 770
            inherited E_Fantasy: TUniEdit
              Width = 243
            end
          end
          inherited pnl_param_row_2: TUniPanel
            Width = 770
            inherited E_City: TUniEdit
              Width = 227
            end
          end
          inherited pnl_param_row_3: TUniPanel
            Width = 770
            ExplicitLeft = 1
            ExplicitTop = 189
            ExplicitWidth = 770
            inherited E_Phone: TUniEdit [0]
              Left = 305
              Top = 3
              Height = 46
              TabOrder = 1
              ExplicitLeft = 391
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_note: TUniEdit [1]
              Left = 406
              Top = 3
              Width = 361
              Height = 46
              TabOrder = 2
            end
            inherited E_Email: TUniEdit [2]
              Left = 3
              Top = 3
              Height = 46
              TabOrder = 3
              ExplicitTop = 4
            end
          end
          object pnl_param_row_4_1: TUniPanel
            Left = 2
            Top = 158
            Width = 770
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 5
            BorderStyle = ubsNone
            Caption = ''
            ExplicitTop = 161
            object E_CNPJ_CPF: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 126
              Height = 46
              Hint = ''
              MaxLength = 14
              Text = ''
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'C.N.P.J / C.P.F'
              FieldLabelAlign = laTop
              ExplicitLeft = 0
              ExplicitTop = 1
              ExplicitHeight = 50
            end
            object RG_Person: TUniRadioGroup
              AlignWithMargins = True
              Left = 135
              Top = 3
              Width = 232
              Height = 46
              Hint = ''
              Items.Strings = (
                'F'#237'sica'
                'Jur'#237'dica'
                'Todos')
              ItemIndex = 2
              Align = alLeft
              Caption = 'Tipo Pessoa'
              TabOrder = 2
              Columns = 3
              ExplicitTop = 1
              ExplicitHeight = 51
            end
          end
        end
        inherited pnl_config: TUniPanel
          Width = 774
          ExplicitWidth = 774
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 774
        inherited dbg_Search: TUniDBGrid
          Width = 774
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome/Raz'#227'o Social'
              Width = 183
            end
            item
              FieldName = 'doc'
              Title.Caption = 'Cnpj/Cpf'
              Width = 149
              ReadOnly = True
            end
            item
              FieldName = 'email'
              Title.Caption = 'Email'
              Width = 331
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 786
    ExplicitWidth = 786
  end
  inherited ds_search: TDataSource
    Left = 680
    Top = 391
  end
  inherited cds_search: TClientDataSet
    Left = 680
    Top = 347
    object cds_searchdoc: TStringField
      FieldName = 'doc'
      ReadOnly = True
      FixedChar = True
      Size = 11
    end
  end
  inherited DSP: TDataSetProvider
    Left = 680
    Top = 304
  end
  inherited MenuTask: TUniMainMenu
    Left = 16
    Top = 288
  end
end
