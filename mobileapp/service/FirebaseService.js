import { uploadBytes, ref, getDownloadURL } from "firebase/storage";
import { storage } from "../fireabase-config";


const uploadImage = async (imageUri, userID) => {
    const img = await fetch(imageUri);
    const bytes = await img.blob();

    const storageRef = ref(storage, 'img.png')

    await uploadBytes(storageRef, bytes);

    const downloadUrl = await getDownloadURL(storageRef);

    return downloadUrl;
}
  

export { uploadImage };