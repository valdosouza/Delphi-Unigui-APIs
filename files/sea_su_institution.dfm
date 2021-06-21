inherited SeaSuInstitution: TSeaSuInstitution
  Caption = 'Super Usu'#225'rio - Pesquisa de Estabelecimento'
  ExplicitHeight = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_search: TUniTabSheet
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome/Raz'#227'o Social'
              Width = 183
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'doc'
              Title.Caption = 'Cnpj/Cpf'
              Width = 149
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'email'
              Title.Caption = 'Email'
              Width = 331
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
end
