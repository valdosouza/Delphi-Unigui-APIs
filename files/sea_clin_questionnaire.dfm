inherited SeaClinQuestionnaire: TSeaClinQuestionnaire
  ClientHeight = 479
  Caption = 'Pesquisa Question'#225'rios'
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Height = 415
    ExplicitHeight = 415
    inherited pc_search: TUniPageControl
      Height = 411
      ActivePage = tbs_param
      ExplicitHeight = 411
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 383
        inherited pnl_param: TUniPanel
          Height = 352
          ExplicitHeight = 352
          object pnl_param_row_4_1: TUniPanel
            Left = 2
            Top = 2
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 1
            BorderStyle = ubsNone
            Caption = ''
            object pnl_data: TUniPanel
              Left = 0
              Top = 0
              Width = 216
              Height = 52
              Hint = ''
              Align = alLeft
              TabOrder = 1
              BorderStyle = ubsNone
              Caption = ''
              object chbx_periodo: TUniCheckBox
                AlignWithMargins = True
                Left = 3
                Top = 5
                Width = 210
                Height = 17
                Hint = ''
                Margins.Top = 5
                Margins.Bottom = 0
                Checked = True
                Caption = 'Data Inicial            Data Final'
                Align = alTop
                TabOrder = 1
              end
              object pnl_data_campos: TUniPanel
                Left = 0
                Top = 22
                Width = 216
                Height = 30
                Hint = ''
                Align = alClient
                TabOrder = 2
                BorderStyle = ubsNone
                Caption = ''
                object DTP_Date_Initial: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 1
                end
                object DTP_Date_End: TUniDateTimePicker
                  AlignWithMargins = True
                  Left = 109
                  Top = 3
                  Width = 100
                  Height = 24
                  Hint = ''
                  DateTime = 42916.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alLeft
                  TabOrder = 2
                end
              end
            end
            object E_Questionnaire: TUniEdit
              AlignWithMargins = True
              Left = 219
              Top = 3
              Width = 309
              Height = 46
              Hint = ''
              Text = ''
              Align = alClient
              TabOrder = 2
              FieldLabel = 'Descri'#231#227'o do Question'#225'rio'
              FieldLabelAlign = laTop
            end
            object ctn_clin_module: TUniContainerPanel
              Left = 531
              Top = 0
              Width = 287
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alRight
              TabOrder = 3
            end
          end
          object pnl_fundo_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 818
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            object Ctn_LineBusiness: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 345
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alLeft
              TabOrder = 1
            end
            object Ctn_clin_professional: TUniContainerPanel
              Left = 345
              Top = 0
              Width = 473
              Height = 52
              Hint = ''
              ParentColor = False
              Align = alClient
              TabOrder = 2
            end
          end
          object pnl_fundo_row_4: TUniPanel
            Left = 2
            Top = 106
            Width = 818
            Height = 25
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            object chbx_ativo: TUniCheckBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 70
              Height = 19
              Hint = ''
              Caption = 'Ativo'
              Align = alLeft
              TabOrder = 1
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 352
          ExplicitTop = 352
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 383
        inherited dbg_Search: TUniDBGrid
          Height = 383
          Columns = <
            item
              FieldName = 'dt_record'
              Title.Caption = 'Data'
              Width = 106
            end
            item
              FieldName = 'module'
              Title.Caption = 'M'#243'dulo'
              Width = 168
              ReadOnly = True
            end
            item
              FieldName = 'speciality'
              Title.Caption = 'Especialidade'
              Width = 170
              ReadOnly = True
            end
            item
              FieldName = 'professional'
              Title.Caption = 'Profissional'
              Width = 265
              ReadOnly = True
            end
            item
              FieldName = 'questionnaire'
              Title.Caption = 'Question'#225'rio'
              Width = 604
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 415
    ExplicitTop = 415
  end
  inherited cds_search: TClientDataSet
    object cds_searchdt_record: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'dt_record'
      Origin = 'dt_record'
    end
    object cds_searchmodule: TStringField
      DisplayLabel = 'M'#243'dulo'
      DisplayWidth = 30
      FieldName = 'module'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchspeciality: TStringField
      DisplayLabel = 'Especialidade'
      DisplayWidth = 100
      FieldName = 'speciality'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchprofessional: TStringField
      DisplayLabel = 'Profissional'
      DisplayWidth = 100
      FieldName = 'professional'
      Origin = 'name_company'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchquestionnaire: TStringField
      DisplayLabel = 'Question'#225'rio'
      DisplayWidth = 100
      FieldName = 'questionnaire'
      Origin = 'description'
      Size = 100
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
    Top = 88
  end
end
