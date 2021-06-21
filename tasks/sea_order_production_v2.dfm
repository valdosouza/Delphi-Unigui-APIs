inherited SeaOrderProductionV2: TSeaOrderProductionV2
  ClientHeight = 544
  Caption = 'Pesquisa de Ordem de Produ'#231#227'o'
  ExplicitHeight = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Height = 480
    ExplicitHeight = 480
    inherited pc_search: TUniPageControl
      Height = 476
      ExplicitHeight = 476
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 448
        inherited pnl_param: TUniPanel
          Height = 448
          ExplicitHeight = 448
          object ChBx_Periodo: TUniCheckBox
            Left = 11
            Top = 7
            Width = 145
            Height = 13
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 1
          end
          object E_Number: TUniEdit
            Left = 207
            Top = 23
            Width = 72
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object L_Codigo: TUniLabel
            Left = 207
            Top = 8
            Width = 44
            Height = 14
            Hint = ''
            Caption = 'N'#250'mero'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            TabOrder = 3
          end
          object Ctn_Situacao: TUniContainerPanel
            Left = 285
            Top = 10
            Width = 356
            Height = 43
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 6
            Top = 23
            Width = 97
            Hint = ''
            ParentShowHint = False
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 5
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 106
            Top = 23
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 6
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 448
        inherited dbg_Search: TUniDBGrid
          Height = 448
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'id'
              Width = 76
              Visible = False
            end
            item
              FieldName = 'tb_institution_id'
              Title.Caption = 'tb_institution_id'
              Width = 100
              Visible = False
            end
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 76
            end
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 96
              ReadOnly = True
            end
            item
              FieldName = 'dt_start'
              Title.Caption = 'Data In'#237'cio'
              Width = 106
            end
            item
              FieldName = 'dt_end'
              Title.Caption = 'Data Final'
              Width = 100
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 480
    ExplicitTop = 480
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      DisplayWidth = 12
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchtb_institution_id: TIntegerField
      DisplayWidth = 16
      FieldName = 'tb_institution_id'
      Origin = 'tb_institution_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchnumber: TIntegerField
      DisplayWidth = 12
      FieldName = 'number'
      Origin = 'number'
    end
    object cds_searchdt_record: TDateField
      DisplayWidth = 14
      FieldName = 'dt_record'
      Origin = 'dt_record'
      ProviderFlags = []
      ReadOnly = True
    end
    object cds_searchdt_start: TDateField
      DisplayWidth = 17
      FieldName = 'dt_start'
      Origin = 'dt_start'
    end
    object cds_searchdt_end: TDateField
      DisplayWidth = 16
      FieldName = 'dt_end'
      Origin = 'dt_end'
    end
  end
end
