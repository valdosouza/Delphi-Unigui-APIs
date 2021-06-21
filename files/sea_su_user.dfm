inherited SeaSuUser: TSeaSuUser
  Caption = 'Super Usuario  - Pesquisa Usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_search: TUniTabSheet
        inherited dbg_Search: TUniDBGrid
          Columns = <
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome'
              Width = 283
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'email'
              Title.Caption = 'E-mail'
              Width = 356
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
end
