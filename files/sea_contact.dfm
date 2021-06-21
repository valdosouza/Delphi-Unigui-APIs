inherited SeaContact: TSeaContact
  Caption = 'Pesquisa de Contato'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        inherited dbg_Search: TUniDBGrid
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
              Width = 332
            end
            item
              FieldName = 'email'
              Title.Caption = 'Email'
              Width = 388
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited DSP: TDataSetProvider
    Left = 184
    Top = 176
  end
end
