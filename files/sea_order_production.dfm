inherited SeaOrderProduction: TSeaOrderProduction
  ClientWidth = 761
  Caption = 'Pesquisa de Ordem de Produ'#231#227'o'
  ExplicitWidth = 777
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 761
    ExplicitWidth = 761
    inherited pc_search: TUniPageControl
      Width = 757
      ExplicitWidth = 757
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 749
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 749
          ExplicitWidth = 749
          object L_Codigo: TUniLabel
            Left = 207
            Top = 10
            Width = 44
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object E_Number: TUniEdit
            Left = 207
            Top = 25
            Width = 72
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object ChBx_Periodo: TUniCheckBox
            Left = 6
            Top = 6
            Width = 145
            Height = 13
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 3
            OnClick = ChBx_PeriodoClick
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 6
            Top = 25
            Width = 97
            Hint = ''
            ParentShowHint = False
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 106
            Top = 25
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 5
          end
          object Ctn_Merchandise: TUniContainerPanel
            Left = 281
            Top = 14
            Width = 468
            Height = 37
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 749
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 749
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              Visible = False
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 64
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data de Cadastro'
              Width = 116
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 500
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 761
    ExplicitWidth = 761
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchnumber: TIntegerField
      FieldName = 'number'
      Origin = 'number'
    end
    object cds_searchdt_record: TDateField
      FieldName = 'dt_record'
      Origin = 'dt_record'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchtb_institution_id: TIntegerField
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
