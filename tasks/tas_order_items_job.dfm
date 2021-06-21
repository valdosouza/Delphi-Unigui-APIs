inherited TasOrderItemsJob: TTasOrderItemsJob
  ClientHeight = 286
  ClientWidth = 702
  ExplicitWidth = 718
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_Top: TUniPanel
    Width = 702
    ExplicitWidth = 702
  end
  inherited pnl_Fundo: TUniPanel
    Width = 702
    Height = 87
    ExplicitWidth = 702
    ExplicitHeight = 87
  end
  inherited Pnl_Botao: TUniPanel
    Top = 222
    Width = 702
    ExplicitTop = 222
    ExplicitWidth = 702
    inherited Sb_Save: TUniSpeedButton
      Left = 510
      ExplicitLeft = 510
    end
    inherited Sb_Cancel: TUniSpeedButton
      Left = 603
      ExplicitLeft = 603
    end
  end
  inherited pnl_detalhes: TUniPanel
    Top = 137
    Width = 702
    ExplicitTop = 137
    ExplicitWidth = 702
    inherited lb_work_front: TUniLabel
      Left = 709
      Top = 7
      Visible = False
      ExplicitLeft = 709
      ExplicitTop = 7
    end
    inherited E_Work_Front: TUniEdit
      Left = 709
      Top = 22
      Width = 77
      Visible = False
      ExplicitLeft = 709
      ExplicitTop = 22
      ExplicitWidth = 77
    end
    inherited L_DtRegistry: TUniLabel
      Left = 598
      ExplicitLeft = 598
    end
    inherited E_DateForecast: TUniDateTimePicker
      Left = 596
      ExplicitLeft = 596
    end
    object Ctn_WorkFront: TUniContainerPanel
      Left = 4
      Top = 3
      Width = 578
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 7
    end
  end
end
