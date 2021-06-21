inherited SeaExtSeal: TSeaExtSeal
  ClientWidth = 400
  Caption = 'Pesquisa de Selo de Extintor'
  ExplicitWidth = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 400
    ExplicitWidth = 400
    inherited pc_search: TUniPageControl
      Width = 396
      ExplicitWidth = 396
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 388
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 388
          ExplicitWidth = 388
          object UniLabel2: TUniLabel
            Left = 127
            Top = 4
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero Selo'
            TabOrder = 1
          end
          object E_nr_last_used: TUniEdit
            Left = 127
            Top = 18
            Width = 121
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object UniDateTimePicker1: TUniDateTimePicker
            Left = 5
            Top = 18
            Width = 120
            Hint = ''
            DateTime = 43000.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object UniLabel1: TUniLabel
            Left = 5
            Top = 4
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Data'
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 388
        ExplicitHeight = 106
        inherited dbg_Search: TUniDBGrid
          Width = 388
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 64
            end
            item
              FieldName = 'nr_last_used'
              Title.Caption = 'N'#250'mero Selo'
              Width = 322
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 400
    ExplicitWidth = 400
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
    end
    object cds_searchnr_last_used: TStringField
      FieldName = 'nr_last_used'
      Size = 50
    end
  end
  inherited DSP: TDataSetProvider
    Left = 153
  end
end
