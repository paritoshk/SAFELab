import pandas as pd


if __name__ == "__main__":
    # read in the dataframe, might need to replace the file name
    ed_notes = pd.read_csv("R---DSI/Notes/ED_Notes2016_18.txt", header=None)
    # clean the data using regex
    ed_notes["clean_text"] = ed_notes["NOTE"].str.replace("<.*?>", "")
    ed_notes["clean_text"] = ed_notes["clean_text"].str.replace("&nbsp;|&#183;", " ")
    ed_notes["clean_text"] = ed_notes["clean_text"].str.replace(".*?>|<span*.", "")
    ed_notes["clean_text"] = ed_notes["clean_text"].str.replace("[^[:alnum:]]", " ")
    # convert to lower
    ed_notes["clean_text"] = ed_notes["clean_text"].str.lower()
    # find all 8-digit numbers
    digits = ed_notes["clean_text"].str.findall("\d{8}")
    print(digits)
