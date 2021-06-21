inherited CadInterationProgress: TCadInterationProgress
  ClientHeight = 467
  ClientWidth = 981
  Caption = 'Cadastro de Progresso'
  ExplicitWidth = 997
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 403
    Width = 981
    ExplicitTop = 403
    ExplicitWidth = 689
  end
  inherited pnl_fundo: TUniPanel
    Width = 981
    ExplicitWidth = 689
    inherited pnl_row_2: TUniPanel
      Width = 977
      ExplicitWidth = 685
      inherited E_Description: TUniEdit
        Width = 971
        ExplicitWidth = 679
      end
    end
    inherited pnl_row_1: TUniPanel
      Width = 977
      ExplicitWidth = 685
      inherited ctn_Customer: TUniContainerPanel
        Width = 977
        ExplicitWidth = 685
      end
    end
  end
  inherited Pc_interacao: TUniPageControl
    Width = 981
    Height = 290
    ExplicitWidth = 689
    ExplicitHeight = 290
    inherited tbs_interacao: TUniTabSheet
      ExplicitWidth = 973
      ExplicitHeight = 262
      inherited pnl_interacao_row_1: TUniPanel
        Top = 210
        Width = 973
        ExplicitTop = 210
        ExplicitWidth = 973
        inherited ctn_Situacao: TUniContainerPanel
          Width = 369
          Align = alClient
          ExplicitWidth = 129
        end
        object DTP_Date_Initial: TUniDateTimePicker
          AlignWithMargins = True
          Left = 372
          Top = 3
          Width = 165
          Height = 46
          Hint = ''
          DateTime = 42916.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDateTime
          Align = alRight
          TabOrder = 2
          FieldLabel = 'Data In'#237'cio'
          FieldLabelAlign = laTop
        end
        object DTP_Date_End: TUniDateTimePicker
          AlignWithMargins = True
          Left = 543
          Top = 3
          Width = 165
          Height = 46
          Hint = ''
          DateTime = 42916.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniDateTime
          Align = alRight
          TabOrder = 3
          FieldLabel = 'Data Fim'
          FieldLabelAlign = laTop
        end
        object ctn_User: TUniContainerPanel
          Left = 711
          Top = 0
          Width = 262
          Height = 52
          Hint = ''
          Margins.Left = 5
          ParentColor = False
          Align = alRight
          TabOrder = 4
          ExplicitLeft = 664
        end
      end
      inherited M_Detail: TUniHTMLMemo
        Width = 967
        Height = 204
        ExplicitWidth = 967
        ExplicitHeight = 204
      end
    end
    inherited tbs_atachament: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 681
      ExplicitHeight = 262
      inherited UniPanel3: TUniPanel
        Width = 973
        ExplicitWidth = 681
      end
      inherited UniDBGrid1: TUniDBGrid
        Width = 967
        Height = 198
      end
    end
  end
  inherited UniFileUpload: TUniFileUpload
    Left = 336
    Top = 184
  end
  inherited DSP: TDataSetProvider
    Left = 424
    Top = 135
  end
  inherited cds_attachament: TClientDataSet
    Left = 496
    Top = 127
  end
  inherited Ds_cds_attachament: TDataSource
    Left = 560
    Top = 120
  end
end
