inherited SeaClinProfessional: TSeaClinProfessional
  Caption = 'Pesquisa Profissional'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_param: TUniTabSheet
        ExplicitHeight = 444
        inherited pnl_param: TUniPanel
          inherited pnl_param_row_1: TUniPanel
            inherited pnl_data: TUniPanel
              inherited ChBx_Periodo: TUniCheckBox
                ExplicitTop = 5
              end
            end
            inherited E_Code: TUniEdit
              ExplicitLeft = 219
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_Reason: TUniEdit
              ExplicitLeft = 280
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_Fantasy: TUniEdit
              ExplicitLeft = 524
              ExplicitTop = 3
              ExplicitHeight = 46
            end
          end
          inherited pnl_param_row_2: TUniPanel
            ExplicitLeft = 2
            ExplicitTop = 54
            inherited E_Neighborhood: TUniEdit
              ExplicitLeft = 3
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_Region: TUniEdit
              ExplicitLeft = 302
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_State: TUniEdit
              ExplicitLeft = 491
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_City: TUniEdit
              ExplicitLeft = 540
              ExplicitTop = 3
              ExplicitHeight = 46
            end
          end
          inherited pnl_param_row_3: TUniPanel
            ExplicitLeft = 2
            ExplicitTop = 106
            inherited E_Phone: TUniEdit
              ExplicitLeft = 305
            end
            inherited E_Email: TUniEdit
              ExplicitTop = 3
            end
          end
          inherited pnl_param_row_4_1: TUniPanel
            ExplicitTop = 158
            inherited E_CNPJ_CPF: TUniEdit
              ExplicitLeft = 3
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited RG_Person: TUniRadioGroup
              ExplicitTop = 3
              ExplicitHeight = 46
            end
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitHeight = 444
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
              Sortable = True
            end
            item
              ShowToolTipAlways = False
              FieldName = 'name_company'
              Title.Caption = 'Nome/Raz'#227'o Social'
              Width = 183
              Sortable = True
            end
            item
              FieldName = 'doc'
              Title.Caption = 'Cnpj/Cpf'
              Width = 149
              ReadOnly = True
              Sortable = True
            end
            item
              FieldName = 'email'
              Title.Caption = 'Email'
              Width = 331
              ReadOnly = True
              Sortable = True
            end>
        end
      end
    end
  end
end
