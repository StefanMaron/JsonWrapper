codeunit 50101 JsonArray
{
    var
        JArray: JsonArray;

    procedure Initialize(JsonText: Text)
    begin
        this.JArray.ReadFrom(JsonText);
    end;

    procedure Initialize(JsonArray: JsonArray)
    begin
        this.JArray := JsonArray;
    end;

    procedure ReadFromYaml(YamlText: Text)
    begin
        this.JArray.ReadFrom(YamlText);
    end;

    procedure WriteToYaml() YamlText: Text
    begin
        this.JArray.WriteTo(YamlText);
    end;

    procedure GetJsonArray(): JsonArray
    begin
        exit(this.JArray);
    end;

    procedure GetAsText(): Text
    begin
        exit(this.JArray.AsToken().AsValue().AsText());
    end;

    #region GetSinge
    procedure GetText(Index: Integer): Text
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsText());
    end;

    procedure GetInteger(Index: Integer): Integer
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsInteger());
    end;


    procedure GetDecimal(Index: Integer): Decimal
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsDecimal());
    end;

    procedure GetBoolean(Index: Integer): Boolean
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsBoolean());
    end;

    procedure GetDateTime(Index: Integer): DateTime
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsDateTime());
    end;

    procedure GetArray(Index: Integer) Return: Codeunit JsonArray
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        Return.Initialize(Value.AsArray());
    end;

    procedure GetObject(Index: Integer) Return: Codeunit JsonObject
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        Return.Initialize(Value.AsObject());
    end;

    procedure GetBigInteger(Index: Integer): BigInteger
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsBigInteger());
    end;

    procedure GetCode(Index: Integer): Code[2048]
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsCode());
    end;

    procedure GetByte(Index: Integer): Byte
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsByte());
    end;

    procedure GetChar(Index: Integer): Char
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsChar());
    end;

    procedure GetDate(Index: Integer): Date
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsDate());
    end;

    procedure GetDuration(Index: Integer): Duration
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsDuration());
    end;

    procedure GetOption(Index: Integer): Option
    var
        Value: JsonToken;
    begin
        this.JArray.Get(Index, Value);
        exit(Value.AsValue().AsOption());
    end;

    #endregion

    #region GetMultiple

    procedure GetObjects() Return: List of [Codeunit JsonObject]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetObject(i));
    end;

    procedure GetTexts() Return: List of [Text]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetText(i));
    end;

    procedure GetIntegers() Return: List of [Integer]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetInteger(i));
    end;

    procedure GetDecimals() Return: List of [Decimal]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetDecimal(i));
    end;

    procedure GetBooleans() Return: List of [Boolean]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetBoolean(i));
    end;

    procedure GetDateTimes() Return: List of [DateTime]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetDateTime(i));
    end;

    procedure GetArrays() Return: List of [Codeunit JsonArray]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetArray(i));
    end;

    procedure GetBigIntegers() Return: List of [BigInteger]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetBigInteger(i));
    end;

    procedure GetCodes() Return: List of [Code[2048]]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetCode(i));
    end;

    procedure GetBytes() Return: List of [Byte]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetByte(i));
    end;

    procedure GetChars() Return: List of [Char]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetChar(i));
    end;

    procedure GetDates() Return: List of [Date]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetDate(i));
    end;

    procedure GetDurations() Return: List of [Duration]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetDuration(i));
    end;

    procedure GetOptions() Return: List of [Integer]
    var
        i: Integer;
    begin
        for i := 0 to this.JArray.Count() - 1 do
            Return.Add(this.GetOption(i));
    end;

    #endregion

    procedure Count(): Integer
    begin
        exit(this.JArray.Count());
    end;

    #region Add

    procedure Add(Value: Variant)
    var
        JsonArray: Codeunit JsonArray;
        JsonObject: Codeunit JsonObject;
    begin
        case true of
            Value.IsText(), Value.IsCode():
                this.AddText(Value);
            Value.IsJsonArray:
                this.AddJsonArray(Value);
            Value.IsJsonObject():
                this.AddJsonObject(Value);
            Value.IsBigInteger():
                this.AddBigInteger(Value);
            Value.IsByte():
                this.AddByte(Value);
            Value.IsChar():
                this.AddChar(Value);
            Value.IsDate():
                this.AddDate(Value);
            Value.IsDuration():
                this.AddDuration(Value);
            Value.IsOption(), Value.IsInteger():
                this.AddInteger(Value);
            Value.IsDecimal():
                this.AddDecimal(Value);
            Value.IsBoolean():
                this.AddBoolean(Value);
            Value.IsDateTime():
                this.AddDateTime(Value);
            Value.IsCodeunit():
                begin
                    if Evaluate(JsonArray, Value) then
                        this.AddJsonArrayCodeunit(JsonArray);
                    if Evaluate(JsonObject, Value) then
                        this.AddJsonObjectCodeunit(JsonObject);
                end;

            else
                Error('Unsupported Type');
        end;
    end;

    local procedure AddText(Value: Text)
    begin
        Message('Hello From Text');
        this.JArray.Add(Value);
    end;

    local procedure AddInteger(Value: Integer)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddDecimal(Value: Decimal)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddBoolean(Value: Boolean)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddDateTime(Value: DateTime)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddJsonArray(Value: JsonArray)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddJsonObject(Value: JsonObject)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddJsonArrayCodeunit(Value: Codeunit JsonArray)
    begin
        this.JArray.Add(Value.GetJsonArray());
    end;

    local procedure AddJsonObjectCodeunit(Value: Codeunit JsonObject)
    begin
        this.JArray.Add(Value.GetJsonObject());
    end;

    local procedure AddBigInteger(Value: BigInteger)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddByte(Value: Byte)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddChar(Value: Char)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddDate(Value: Date)
    begin
        this.JArray.Add(Value);
    end;

    local procedure AddDuration(Value: Duration)
    begin
        this.JArray.Add(Value);
    end;

    #endregion

    #region Set

    procedure Set(Index: Integer; Value: Variant)
    var
        JsonArray: Codeunit JsonArray;
        JsonObject: Codeunit JsonObject;
    begin
        case true of
            Value.IsText(), Value.IsCode():
                this.SetText(Index, Value);
            Value.IsJsonArray:
                this.SetJsonArray(Index, Value);
            Value.IsJsonObject():
                this.SetJsonObject(Index, Value);
            Value.IsBigInteger():
                this.SetBigInteger(Index, Value);
            Value.IsByte():
                this.SetByte(Index, Value);
            Value.IsChar():
                this.SetChar(Index, Value);
            Value.IsDate():
                this.SetDate(Index, Value);
            Value.IsDuration():
                this.SetDuration(Index, Value);
            Value.IsOption(), Value.IsInteger():
                this.SetInteger(Index, Value);
            Value.IsDecimal():
                this.SetDecimal(Index, Value);
            Value.IsBoolean():
                this.SetBoolean(Index, Value);
            Value.IsDateTime():
                this.SetDateTime(Index, Value);
            Value.IsCodeunit():
                begin
                    if Evaluate(JsonArray, Value) then
                        this.SetJsonArrayCodeunit(Index, JsonArray);
                    if Evaluate(JsonObject, Value) then
                        this.SetJsonObjectCodeunit(Index, JsonObject);
                end;

            else
                Error('Unsupported Type');
        end;
    end;

    local procedure SetText(Index: Integer; Value: Text)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetInteger(Index: Integer; Value: Integer)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetDecimal(Index: Integer; Value: Decimal)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetBoolean(Index: Integer; Value: Boolean)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetDateTime(Index: Integer; Value: DateTime)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetJsonArray(Index: Integer; Value: JsonArray)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetJsonObject(Index: Integer; Value: JsonObject)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetJsonArrayCodeunit(Index: Integer; Value: Codeunit JsonArray)
    begin
        this.JArray.Set(Index, Value.GetJsonArray());
    end;

    local procedure SetJsonObjectCodeunit(Index: Integer; Value: Codeunit JsonObject)
    begin
        this.JArray.Set(Index, Value.GetJsonObject());
    end;

    local procedure SetBigInteger(Index: Integer; Value: BigInteger)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetByte(Index: Integer; Value: Byte)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetChar(Index: Integer; Value: Char)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetDate(Index: Integer; Value: Date)
    begin
        this.JArray.Set(Index, Value);
    end;

    local procedure SetDuration(Index: Integer; Value: Duration)
    begin
        this.JArray.Set(Index, Value);
    end;


    #endregion

    procedure RemoveAt(Index: Integer)
    begin
        this.JArray.RemoveAt(Index);
    end;

    procedure InitObjectProperty() Return: Codeunit JsonObject
    begin
        this.JArray.Add(Return.GetJsonObject());
    end;

    procedure InitArrayProperty() Return: Codeunit JsonArray
    begin
        this.JArray.Add(Return.GetJsonArray());
    end;
}