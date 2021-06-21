inherited SeaOrderBudgetPi: TSeaOrderBudgetPi
  ClientWidth = 827
  Caption = 'Pesquisa de Or'#231'amento'
  ExplicitWidth = 843
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 827
    ExplicitWidth = 827
    inherited pc_search: TUniPageControl
      Width = 823
      ExplicitWidth = 823
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 815
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 815
          ExplicitWidth = 815
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 3
            Top = 35
            Width = 89
            Hint = ''
            DateTime = 42934.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
          end
          object DTP_Date_end: TUniDateTimePicker
            Left = 97
            Top = 35
            Width = 86
            Hint = ''
            DateTime = 42934.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object UniLabel1: TUniLabel
            Left = 189
            Top = 19
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Or'#231'amento'
            TabOrder = 3
          end
          object E_cotacao: TUniEdit
            Left = 189
            Top = 35
            Width = 121
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object E_name_company: TUniEdit
            Left = 316
            Top = 35
            Width = 416
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniLabel2: TUniLabel
            Left = 316
            Top = 19
            Width = 160
            Height = 13
            Hint = ''
            Caption = 'Nome Cliente / Ag'#234'ncia / Contato'
            TabOrder = 6
          end
          object UniCheckBox1: TUniCheckBox
            Left = 738
            Top = 19
            Width = 63
            Height = 17
            Hint = ''
            Caption = 'Vencidos'
            TabOrder = 7
          end
          object UniCheckBox2: TUniCheckBox
            Left = 738
            Top = 40
            Width = 74
            Height = 17
            Hint = ''
            Caption = 'Arquivados'
            TabOrder = 8
          end
          object chbx_date: TUniCheckBox
            Left = 3
            Top = 17
            Width = 180
            Height = 17
            Hint = ''
            Caption = 'Data Inicial        Data Final'
            TabOrder = 9
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 815
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 815
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'tb_institution_id'
              Title.Caption = 'tb_institution_id'
              Width = 81
              Visible = False
            end
            item
              FieldName = 'number'
              Title.Caption = 'Or'#231'amento'
              Width = 64
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 64
            end
            item
              FieldName = 'advertiser'
              Title.Caption = 'Anunciante'
              Width = 604
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 827
    ExplicitWidth = 827
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      Origin = 'number'
      Required = True
    end
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchadvertiser: TStringField
      FieldName = 'advertiser'
      Origin = 'advertiser'
      Required = True
      Size = 100
    end
  end
  inherited DSP: TDataSetProvider
    Top = 160
  end
end
