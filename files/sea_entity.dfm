inherited SeaEntity: TSeaEntity
  ClientHeight = 540
  ClientWidth = 780
  Caption = 'Pesquisa de Entidade'
  ExplicitWidth = 796
  ExplicitHeight = 599
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 780
    Height = 476
    ExplicitWidth = 780
    ExplicitHeight = 476
    inherited pc_search: TUniPageControl
      Width = 776
      Height = 472
      ExplicitWidth = 776
      ExplicitHeight = 472
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 768
        ExplicitHeight = 444
        inherited pnl_param: TUniPanel
          Width = 768
          Height = 413
          ExplicitTop = -2
          ExplicitWidth = 768
          ExplicitHeight = 413
          object ChBx_Active: TUniCheckBox
            Left = 6
            Top = 164
            Width = 63
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Ativos'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object pnl_param_row_1: TUniPanel
            Left = 2
            Top = 2
            Width = 764
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 2
            BorderStyle = ubsNone
            Caption = ''
            ExplicitLeft = 3
            ExplicitTop = 148
            ExplicitWidth = 760
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
              object ChBx_Periodo: TUniCheckBox
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
                ExplicitTop = 2
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
            object E_Code: TUniEdit
              AlignWithMargins = True
              Left = 219
              Top = 3
              Width = 55
              Height = 46
              Hint = ''
              Text = ''
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'C'#243'digo'
              FieldLabelAlign = laTop
              ExplicitLeft = 217
              ExplicitTop = 1
              ExplicitHeight = 50
            end
            object E_Reason: TUniEdit
              AlignWithMargins = True
              Left = 280
              Top = 3
              Width = 238
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'Nome / Raz'#227'o Social'
              FieldLabelAlign = laTop
              ExplicitLeft = 281
              ExplicitTop = 5
              ExplicitHeight = 44
            end
            object E_Fantasy: TUniEdit
              AlignWithMargins = True
              Left = 524
              Top = 3
              Width = 237
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Align = alClient
              TabOrder = 4
              FieldLabel = 'Nome Fantasia'
              FieldLabelAlign = laTop
              ExplicitLeft = 525
              ExplicitTop = 5
              ExplicitWidth = 231
              ExplicitHeight = 44
            end
          end
          object pnl_param_row_2: TUniPanel
            Left = 2
            Top = 54
            Width = 764
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 3
            BorderStyle = ubsNone
            Caption = ''
            ExplicitLeft = 3
            ExplicitTop = 141
            ExplicitWidth = 762
            object E_Neighborhood: TUniEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 293
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 100
              Text = ''
              ParentFont = False
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'Bairro'
              FieldLabelAlign = laTop
              ExplicitLeft = 4
              ExplicitTop = 30
              ExplicitHeight = 22
            end
            object E_Region: TUniEdit
              AlignWithMargins = True
              Left = 302
              Top = 3
              Width = 183
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Regi'#227'o'
              FieldLabelAlign = laTop
              ExplicitLeft = 299
              ExplicitTop = 30
              ExplicitHeight = 22
            end
            object E_State: TUniEdit
              AlignWithMargins = True
              Left = 491
              Top = 3
              Width = 43
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 2
              Text = ''
              ParentFont = False
              Align = alLeft
              TabOrder = 3
              FieldLabel = 'U.F.'
              FieldLabelAlign = laTop
              ExplicitLeft = 484
              ExplicitTop = 30
              ExplicitHeight = 22
            end
            object E_City: TUniEdit
              AlignWithMargins = True
              Left = 540
              Top = 3
              Width = 221
              Height = 46
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 100
              Text = ''
              ParentFont = False
              Align = alClient
              TabOrder = 4
              FieldLabel = 'Cidade'
              FieldLabelAlign = laTop
              ExplicitLeft = 527
              ExplicitTop = 30
              ExplicitWidth = 235
              ExplicitHeight = 22
            end
          end
          object pnl_param_row_3: TUniPanel
            Left = 2
            Top = 106
            Width = 764
            Height = 52
            Hint = ''
            Align = alTop
            TabOrder = 4
            BorderStyle = ubsNone
            Caption = ''
            ExplicitTop = 256
            ExplicitWidth = 750
            object E_Email: TUniEdit
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 296
              Height = 44
              Hint = ''
              CharCase = ecLowerCase
              MaxLength = 100
              Text = ''
              ParentFont = False
              Align = alLeft
              TabOrder = 1
              FieldLabel = 'e-mail'
              FieldLabelAlign = laTop
              ExplicitTop = 5
            end
            object E_Phone: TUniEdit
              AlignWithMargins = True
              Left = 306
              Top = 4
              Width = 95
              Height = 44
              Hint = ''
              Text = ''
              ParentFont = False
              Align = alLeft
              TabOrder = 2
              FieldLabel = 'Fone'
              FieldLabelAlign = laTop
              ExplicitTop = 5
            end
            object E_note: TUniEdit
              AlignWithMargins = True
              Left = 407
              Top = 4
              Width = 353
              Height = 44
              Hint = ''
              Text = ''
              ParentFont = False
              Align = alClient
              TabOrder = 3
              FieldLabel = 'Observa'#231#227'o'
              FieldLabelAlign = laTop
              ExplicitLeft = 387
              ExplicitTop = 29
              ExplicitWidth = 363
              ExplicitHeight = 23
            end
          end
        end
        inherited pnl_config: TUniPanel
          Top = 413
          Width = 768
          ExplicitTop = 413
          ExplicitWidth = 768
          inherited chbx_limit_result: TUniCheckBox
            ExplicitLeft = 4
            ExplicitTop = 4
          end
          inherited E_Limit: TUniEdit
            ExplicitTop = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 768
        ExplicitHeight = 444
        inherited dbg_Search: TUniDBGrid
          Width = 768
          Height = 444
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome'
              Width = 310
            end
            item
              FieldName = 'email'
              Title.Caption = 'Email'
              Width = 372
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 476
    Width = 780
    ExplicitTop = 476
    ExplicitWidth = 780
  end
  inherited ds_search: TDataSource
    Left = 176
    Top = 271
  end
  inherited cds_search: TClientDataSet
    Left = 176
    Top = 227
    object cds_searchid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      Origin = 'name_company'
      Required = True
      Size = 100
    end
    object cds_searchemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  inherited DSP: TDataSetProvider
    Left = 176
    Top = 184
  end
end
